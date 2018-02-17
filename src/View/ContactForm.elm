module View.ContactForm exposing (contactForm)

import Types.Types as Types
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


contactForm : Types.Model -> Html Types.Msg
contactForm model =
    div [ id "contact", class "w-100 center mw6-ns pa3-ns ph5-ns mb2 mb6-ns" ]
        [ div [ class "f5 tc mb3" ] [ text "Let's get in touch:" ]
        , input
            [ class "fl w-50-ns w-100 pa2 ba b--light-gray"
            , placeholder "Name"
            , onInput Types.ContactFormChangeName
            , value model.contactFormName
            ]
            []
        , input
            [ class "fl w-50-ns w-100 pa2 ba b--light-gray"
            , placeholder "Email"
            , onInput
                Types.ContactFormChangeEmail
            , value model.contactFormEmail
            ]
            []
        , textarea
            [ class "w-100 h4 dib v-top ba b--light-gray"
            , placeholder "Message"
            , onInput Types.ContactFormChange
            , value model.contactFormMessage
            ]
            []
        , button
            [ onClick Types.SendForm, class "mt2 bg-light-gray ba b--light-gray" ]
            [ text "Submit" ]
        ]
