<?php

namespace YoastSeoForTypo3\YoastSeo\Backend\Controller;


use Psr\Http;
use TYPO3\CMS;
use YoastSeoForTypo3\YoastSeo;

class PageContentController
{

    /**
     * @param Http\Message\ServerRequestInterface $request
     * @param Http\Message\ResponseInterface $response
     *
     * @return Http\Message\ResponseInterface
     */
    public function renderPagePreview(Http\Message\ServerRequestInterface $request, Http\Message\ResponseInterface $response)
    {
        $contentRecords = null;
        $currentPage = null;
        $data = array(
            'meta' => array(),
            'content' => array()
        );

        $queryParameters = $request->getQueryParams();

        if (array_key_exists('yoast', $queryParameters) && is_array($queryParameters['yoast'])
            && array_key_exists('preview', $queryParameters['yoast'])
            && is_array($queryParameters['yoast']['preview'])
            && array_key_exists('page', $queryParameters['yoast']['preview'])
            && !empty($queryParameters['yoast']['preview']['page'])
            && CMS\Core\Utility\MathUtility::canBeInterpretedAsInteger($queryParameters['yoast']['preview']['page'])
        ) {
            $currentPage = CMS\Backend\Utility\BackendUtility::getRecord(
                'pages',
                (int) $queryParameters['yoast']['preview']['page']
            );
        }

        if (is_array($currentPage)) {
            array_walk($currentPage, function ($columnValue, $columnName) use (&$data) {
                if (in_array($columnName, array(
                    'title',
                    'subtitle',
                    'nav_title',
                    'description',
                    'author',
                    'author_email',
                    YoastSeo\Backend\PageLayoutHeader::COLUMN_NAME
                ))) {
                    $data['meta'][$columnName] = $columnValue;
                }
            });

            $data['meta']['url'] = CMS\Core\Utility\GeneralUtility::getIndpEnv('TYPO3_SITE_URL');

            // fake a speaking URL by just lowercasing the titles in the pages' root line
            $path = array();
            $rootLine = CMS\Backend\Utility\BackendUtility::BEgetRootLine($currentPage['uid']);

            foreach ($rootLine as $pageRecord) {
                if (empty($pageRecord['is_siteroot'])) {
                    $path[] = strtolower(str_replace(' ', '-', $pageRecord['title']));
                } else {
                    break;
                }
            };

            if (!empty($path)) {
                $data['meta']['url'] .= implode('/', array_reverse($path)) . '/';
            }
        }

        if (is_array($currentPage) && array_key_exists('pid', $currentPage)) {
            $contentRecords = CMS\Backend\Utility\BackendUtility::getRecordsByField(
                'tt_content',
                'pid',
                $currentPage['uid'],
                '',
                '',
                'colPos, sorting'
            );
        }

        if (is_array($contentRecords)) {
            $data['content'] = array_map(function (array $contentRecord) {
                $filteredContentRecord = array();

                array_walk($contentRecord, function ($columnValue, $columnName) use (&$filteredContentRecord) {
                    if (in_array($columnName, array(
                        'header',
                        'bodytext',
                        'colPos',
                        'sorting',
                        'CType'
                    ))) {
                        $filteredContentRecord[$columnName] = $columnValue;
                    }
                });

                return $filteredContentRecord;
            }, $contentRecords);
        }

        $response->getBody()->write(json_encode($data));

        return $response;
    }

}