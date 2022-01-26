module Main exposing (render, init)

import Html exposing (text, div)
import Html.Attributes exposing (style)

grid = div [style "width" "360px"
            , style "height" "360px"
            , style "grid-template-columns" "repeat(9, 40px)"
            , style "grid-template-rows" "repeat(9, 40px)"
            , style "display" "grid"
           ] gridElements



gridElements = [ intersection ]


intersection = div [style "width" "40px"
            , style "height" "40px"
            , style "background-color" "#FFC300"
            , style "border" "dashed 1px black"
            ] []

render : Position -> List (Html.Html msg)
render position = gridElements

-- MAIN

main = grid

-- MODEL

type alias Intersection = 
        { state : State
        }

type alias Position = 
        { dimensions : Int
        , board : List (List Intersection) }

type State = Black | White | Empty

init : Position
init = { board =  [[{state = Empty}, {state = Black}]], dimensions = 9 }

