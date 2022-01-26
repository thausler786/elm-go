module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import Html exposing (div)
import Html.Attributes exposing (style)

import Main exposing (render, init)

suite : Test
suite =
    describe "Rendering a board"
        [ test "renders a number of spaces equal to those in the model" <|
            \_ -> 
                render init
                    |> Expect.equal [div [style "width" "40px"
                                           , style "height" "40px"
                                           , style "background-color" "#FFC300"
                                           , style "border" "dashed 1px black"
                                          ] []
                                    ]
        ]
              
