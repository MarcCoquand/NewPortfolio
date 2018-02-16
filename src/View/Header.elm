module View.Header exposing (header)

import Types.Types as Types exposing (Model, Msg)
import Html exposing (..)
import Html.Attributes exposing (..)
import Utils
import Color
import Color.Convert exposing (colorToCssRgb)


green : Color.Color
green =
    (Color.rgb 72 177 119)


headerText : String
headerText =
    """
I can help you research, prototype, develop and deploy your websites,
services, apps and products. I specialize in UX, service design and
web development."""


showHeaderImg : Model -> Attribute Msg
showHeaderImg model =
    if model.showHeaderImg then
        class "fadeinChild"
    else
        class ""


header : Model -> Html Msg
header model =
    div
        [ class ("white cover flex flex-column pa3-ns relative ")

        --, style
        --[ ( "backgroundColor"
        --, colorToCssRgb green
        --)
        --]
        , showHeaderImg model
        ]
        [ img
            [ class "center br-100 h4 mw4 mt5-ns mt4 mb3"
            , src "img/marc.jpg"
            ]
            []
        , div [ class "ls3 b f1-ns f2 lh-title tc mb5-ns mb3" ]
            [ text "Hi, my name is Marc." ]
        , div [ class "fw1 ls1 measure-wide lh-copy tc-ns tj pl2 pr2 center" ] [ text headerText ]
        , a
            [ class "mt4-ns f5-ns mt2 o-60 center tc glow white no-underline hover\n            mw5\n          pr3 pl3 ba bw1 br-pill pa2"
            , href "#contact"
            ]
            [ text "Contact" ]
        , div [ class "mt4-ns mt4 tc mb6" ]
            [ a [ href "#feature", class "bounce oln o-60 glow link chevron-down no-underline white fas fa-3x fa-chevron-down" ] [] ]
        ]
