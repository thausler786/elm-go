module Main exposing (init, render)

import Html exposing (div, text)
import Html.Attributes exposing (style)
import Dict exposing (Dict)

grid =
    div
        [ style "width" "360px"
        , style "height" "360px"
        , style "grid-template-columns" "repeat(9, 40px)"
        , style "grid-template-rows" "repeat(9, 40px)"
        , style "display" "grid"
        ]
        (render init)

render : Position -> List (Html.Html msg)
render position =
    position.board |> List.foldl (List.append) [] |> List.map renderIntersection

renderIntersection intersectionRecord = 
  div
        [ style "width" "40px"
        , style "height" "40px"
        , style "background-color" (stateToColor intersectionRecord.state)
        , style "border" "dashed 1px black"
        ]
        []

stateToColor : String -> String
stateToColor state = 
  case state of
    "Black" -> "black"
    "White" -> "white"
    "Empty" -> "#FFC300"
    _ -> "red"

-- MAIN


main =
    grid

-- MODEL


type alias Intersection =
    { state : String
    }


type alias Position =
    { dimensions : Int
    , board : List (List Intersection)
    }



init : Position
init =
    { board = [ [ { state = "Empty" }, { state = "Black" } ] ], dimensions = 9 }
