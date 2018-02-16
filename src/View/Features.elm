module View.Features exposing (features)

import Types.Types exposing (Model, Msg)
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown
import Color
import Color.Convert exposing (colorToCssRgb)


green : Color.Color
green =
    (Color.rgb 72 177 119)


type Side
    = Left
    | Right


type alias MarkdownText =
    String



-- A CSS font icon such as material-icons or font-awesome


type alias Icon =
    String


rightDesign : MarkdownText
rightDesign =
    """
### Get the *right* website


What I create is designed not just to look nice but also to function. My designs
are done with the latest HCI design methods so you mitigate time and risks while
increasing ROI.
"""


furtherDevelopment : MarkdownText
furtherDevelopment =
    """
### Reuse the backend for your mobile apps

Choosing the right technology stack can be important to avoid having to
duplicate your development in the future. The code used to create the backend
server used for my websites can later be reused for Android and iOS apps.

"""


lowMaintenance : MarkdownText
lowMaintenance =
    """
### Very low maintenance

The websites I create have very low maintenance, if any at all.

"""


fast : MarkdownText
fast =
    """
### Blazing fast

A website that takes more than 2 seconds to load has a page abondonment of 15%
or higher. I ensure that your website loads in less than half a second.

"""


customizable : MarkdownText
customizable =
    """
### Have it just the way you want

The websites I create are created from scratch. This means that there is a
greater flexibility in what would be possible than other vendors that create
their website in Wordpress and other WYIWYG editors.

"""



-- Icon should be a css icon such as for example a font-awesome icon


featureLeft : MarkdownText -> Icon -> Html Msg
featureLeft feat icon =
    div
        [ class
            """w-100 pa3-ns flex flex-column-reverse items-center
            justify-end flex-row-m justify-start-m mb4"""
        ]
        [ div [ class "flex lh-copy self-start-l dib v-top mw6-m ls1 w-90 fw1 tl f6 fl center" ]
            [ Markdown.toHtml [] feat ]
        , div [ class "flex tc w-30 center mb2", class icon ] []
        ]


feature : MarkdownText -> Icon -> Html Msg
feature feat icon =
    div
        [ class
            """w-100 pa3-ns mb4 flex items-center flex-row-m flex-column"""
        ]
        [ div [ class "flex tc w-30 center mb2", class icon ] []
        , div [ class "flex lh-copy ls1 w-90 fw1 tl mw6-m f6 fl center " ]
            [ Markdown.toHtml [] feat ]
        ]


features : Model -> Html Msg
features model =
    div [ id "feature", class "white pa3-ns pa1", style [ ( "backgroundColor", colorToCssRgb green ) ] ]
        [ div [ class "mb6 w-100 center " ]
            [ div [ class "b f3-ns f4 ls2 tc w-100 mb5 mt3" ] [ text "Why you should hire me:" ]
            , div [ class "flex flex-column ph3-ns ph1-m flex-row-l" ]
                [ feature rightDesign "fas fa-3x fa-check"
                , featureLeft fast "fas fa-rocket fa-3x"
                , feature customizable "fas fa-3x fa-sliders-h"
                ]
            ]
        ]
