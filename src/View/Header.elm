module View.Header exposing (header)

import Types.Types as Types exposing (Model, Msg)
import Html exposing (..)
import Html.Attributes exposing (..)
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
            [ class "center br-100 h4 mw4 mt5 mb5 "
            , src "img/marc.jpg"
            ]
            []

        --, div
        --[ class
        --"""courier fw1 f5-ns f6 ls1 measure-wide lh-copy typewriter tc-ns tj pl3 pr3 pl2-ns pr3-ns center"""
        --]
        --[ text "I can help you create awesome websites" ]
        , div
            [ class
                """fw1 f1-ns f4  pa2 ls1 measure-wide lh-copy tc center b"""
            ]
            [ text "Hi, I'm Marc. I can help you "
            ]
        , div
            [ class
                """typewriter mb4 f1-ns b f4 ls1 measure-wide lh-copy tc center"""
            ]
            [ text ("with " ++ model.typeWriter.toShow) ]
        , a
            [ class
                """f5-ns mt5-ns mt6 mb3 o-60  center tc glow white no-underline hover greenhover mw5 pr3 pl3 ba bw1 br-pill pa2"""
            , href "#contact"
            ]
            [ text "Get in touch" ]
        , div [ class "mt5 mt5-l tc mb4" ]
            [ a [ href "#feature", class "bounce oln o-60 glow link chevron-down no-underline white fas fa-3x fa-chevron-down" ] [] ]
        ]
