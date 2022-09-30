module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Html exposing (div)
import Html.Attributes exposing (style)
import Main exposing (init, render)
import Test exposing (..)



emptyDiv =                 div
                            [ style "width" "40px"
                            , style "height" "40px"
                            , style "background-color" "#FFC300"
                            , style "border" "dashed 1px black"
                            ]
                            []
 
blackDiv =                 div
                            [ style "width" "40px"
                            , style "height" "40px"
                            , style "background-color" "black"
                            , style "border" "dashed 1px black"
                            ]
                            []

whiteDiv =                 div
                            [ style "width" "40px"
                            , style "height" "40px"
                            , style "background-color" "white"
                            , style "border" "dashed 1px black"
                            ]
                            []


  
suite : Test

suite =
    describe "Rendering a board"
        [ test "renders a number of spaces equal to those in the model" <|
            \_ ->
                render init
                    |> Expect.equal
                        [ emptyDiv, blackDiv]
         , test "renders different colors for intersections with different states" <|
           \_ ->
              render { board = [ [ {
                                    state = "Empty"}
                                    , { state = "Black"}
                                    , {state = "White"}
                                ] ]
                              , dimensions = 9
                     }
                 |> Expect.equal [emptyDiv, blackDiv, whiteDiv]
        ]
