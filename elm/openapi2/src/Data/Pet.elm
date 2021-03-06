{-
   Swagger Petstore
   No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

   OpenAPI spec version: 1.0.0

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.Pet exposing (Pet(..), petDecoder, petEncoder)

import DateOnly exposing (DateOnly, dateOnlyDecoder, dateOnlyEncoder)
import Data.Cat exposing (Cat, catDecoder, catEncoder)
import Data.Dog exposing (Dog, dogDecoder, dogEncoder)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode
import Maybe exposing (map, withDefault)


type Pet
    = CatType Cat
    | DogType Dog


petDecoder : Decoder Pet
petDecoder =
    Decode.field "type" Decode.string
        |> Decode.andThen petTypeDecoder


petTypeDecoder : String -> Decoder Pet
petTypeDecoder tag =
    case tag of
        "Cat" ->
            Decode.map CatType Cat.decoder

        "Dog" ->
            Decode.map DogType Dog.decoder

        _ ->
            Decode.fail <| "Trying to decode Pet, but type " ++ tag ++ " is not supported."


petEncoder : Pet -> Encode.Value
petEncoder model =
    case model of
        CatType subModel ->
            Cat.encoder "Cat" subModel

        DogType subModel ->
            Dog.encoder "Dog" subModel


