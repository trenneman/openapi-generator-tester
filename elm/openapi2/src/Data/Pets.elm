{-
   Swagger Petstore
   No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

   OpenAPI spec version: 1.0.0

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.Pets exposing (Pets, petsDecoder, petsEncoder)

import Data.Pet exposing (Pet, petDecoder, petEncoder)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode
import Maybe exposing (map, withDefault)


type alias Pets =
    List Pet


petsDecoder : Decoder Pets
petsDecoder =
    Decode.list petDecoder


petsEncoder : Pets -> Encode.Value
petsEncoder items =
    Encode.list petEncoder items

