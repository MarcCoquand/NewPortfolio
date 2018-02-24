--| UPDATE |--


module Update.Update exposing (update)

import Types.Types as Types exposing (..)
import Ports.Firebase as Firebase exposing (..)
import Update.Typewriter as Typewriter


update : Types.Msg -> Types.Model -> ( Types.Model, Cmd Types.Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ResetForm ->
            ( { model
                | contactFormName = ""
                , contactFormEmail = ""
                , contactFormMessage = ""
              }
            , Cmd.none
            )

        TickTypewriter _ ->
            ( { model | typeWriter = (Typewriter.update model.typeWriter) }
            , Cmd.none
            )

        HeaderImgLoaded bool ->
            ( { model | showHeaderImg = bool }, Cmd.none )

        ContactFormChange s ->
            ( { model | contactFormMessage = s }, Cmd.none )

        ContactFormChangeName s ->
            ( { model | contactFormName = s }, Cmd.none )

        ContactFormChangeEmail s ->
            ( { model | contactFormEmail = s }, Cmd.none )

        SentFormResult result ->
            case result of
                True ->
                    ( { model
                        | contactFormName = ""
                        , contactFormEmail = ""
                        , contactFormMessage = ""
                        , formSendStatus = Successful
                      }
                    , Cmd.none
                    )

                False ->
                    ( { model | formSendStatus = Fail }, Cmd.none )

        SendForm ->
            ( { model | formSendStatus = Ongoing }
            , Firebase.sendContactInfo
                { contactFormName = model.contactFormName
                , contactFormEmail = model.contactFormEmail
                , contactFormMessage = model.contactFormMessage
                }
            )
