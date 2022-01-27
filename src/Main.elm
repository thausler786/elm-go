module Main exposing (init, render)

import Html exposing (div, text)
import Html.Attributes exposing (style)


grid =
    div
        [ style "width" "360px"
        , style "height" "360px"
        , style "grid-template-columns" "repeat(9, 40px)"
        , style "grid-template-rows" "repeat(9, 40px)"
        , style "display" "grid"
        ]
        gridElements


gridElements =
    [ intersectionDiv ]


intersectionDiv =
    div
        [ style "width" "40px"
        , style "height" "40px"
        , style "background-color" "#FFC300"
        , style "border" "dashed 1px black"
        ]
        []


render : Position -> List (Html.Html msg)
render position =
    position.board |> List.foldl (List.append) [] |> List.map renderIntersection

renderIntersection intersectionRecord = intersectionDiv

-- MAIN


main =
    grid



-- MODEL


type alias Intersection =
    { state : State
    }


type alias Position =
    { dimensions : Int
    , board : List (List Intersection)
    }

type State
    = Black
    | White
    | Empty


init : Position
init =
    { board = [ [ { state = Empty }, { state = Black } ] ], dimensions = 9 }
