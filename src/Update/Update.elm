--| UPDATE |--


module Update.Update exposing (update)

import Types.Types as Types exposing (..)


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

        HeaderImgLoaded bool ->
            ( { model | showHeaderImg = bool }, Cmd.none )

        ContactFormChange s ->
            ( { model | contactFormMessage = s }, Cmd.none )

        ContactFormChangeName s ->
            ( { model | contactFormName = s }, Cmd.none )

        ContactFormChangeEmail s ->
            ( { model | contactFormEmail = s }, Cmd.none )

        --TODO
        SendForm ->
            ( { model
                | contactFormName = ""
                , contactFormEmail = ""
                , contactFormMessage = ""
              }
            , Cmd.none
            )
