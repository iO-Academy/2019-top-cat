<?php


class DB
{
    private $serverdb = 'mysql:host=192.168.20.20; db=name=';
    private $dbname = '';
    private $username = 'root';
    private $password = '';

    // Create connection
    public function dbConnect($serverdb, $dbname, $username, $password)
    {
        $dbconnect = new PDO($serverdb . $dbname, $username, $password);
        $dbconnect->setAttribute(
            PDO::ATTR_DEFAULT_FETCH_MODE,
            PDO::FETCH_ASSOC);
    }

    public function getCatBreed()
    {
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.thecatapi.com/v1/breeds/",
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => array(
                'x-api-key: ec254e44-3996-458b-8522-4933954d8fcd'
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);

        $responseArray = json_decode($response, true);
        $breedArray = [];
        for ($i = 0; $i < count($responseArray); $i++) {
            array_push($breedArray, $responseArray[$i]["id"]);
        }
        return $breedArray;
    }

    // Get img src from the Cat API
    public function getCatImg()
    {
        $breedId = $this->getCatBreed();
        $catImgUrl = [];
        echo "<br>";
        echo "<br>";
        foreach ($breedId as $id) {
            $catImgApiUrl = 'https://api.thecatapi.com/v1/images/search?breed_ids=' . $id . '&limit=9';
            array_push($catImgUrl, $catImgApiUrl);
        }

        foreach ($catImgUrl as $apiUrl) {
            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => $apiUrl,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_HTTPHEADER => array(
                    'x-api-key: ec254e44-3996-458b-8522-4933954d8fcd'
                ),
            ));

            $ImgApiresponse = curl_exec($curl);
            $err = curl_error($curl);
            curl_close($curl);

            $responseArray = json_decode($ImgApiresponse, true);
            $imgSrcArray = [];
            for ($i = 0; $i < count($responseArray); $i++) {
                array_push($imgSrcArray, $responseArray[$i]["id"]);
            }
        }
        return $imgSrcArray;
    }
}

$test = new DB();
$result = $test->getCatImg();
var_dump($result);