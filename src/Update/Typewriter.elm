module Update.Typewriter exposing (..)

import Types.Types exposing (..)


-- The amount of time that you want to display a message


waitTime : Int
waitTime =
    70



-- The wait time before the typewriter should start typing


shorterWaitTime : Int
shorterWaitTime =
    30


write : Typewriter -> Typewriter
write typewriter =
    let
        popLetter =
            String.uncons typewriter.toWrite
    in
        case popLetter of
            Just ( c, cs ) ->
                { typewriter | toShow = typewriter.toShow ++ String.fromChar c, toWrite = cs }

            Nothing ->
                -- Since there is nothing to write it means we've displayed the
                -- entire message and can set the state to showing
                { typewriter | state = Showing }


erase : Typewriter -> Typewriter
erase typewriter =
    if typewriter.toShow |> String.isEmpty then
        let
            -- Makes sure to reset the stack of sentences if they have all
            -- been shown, otherwise just continues with the current stack
            statementStack =
                if typewriter.nextStatement |> List.isEmpty then
                    typewriter.statements
                else
                    typewriter.nextStatement

            popStatementStack =
                case statementStack |> List.head of
                    Nothing ->
                        ""

                    Just a ->
                        a

            -- The rest of the list of statements that haven't been shown
            statementTail =
                case statementStack |> List.tail of
                    Nothing ->
                        []

                    Just a ->
                        a
        in
            { typewriter
                | toWrite = popStatementStack
                , state = WaitingToType
                , nextStatement = statementTail
            }
    else
        { typewriter | toShow = String.dropRight 1 typewriter.toShow }



-- A small pause before erasing the word so people can read what is written


showText : Typewriter -> Typewriter
showText typewriter =
    case typewriter.toWait of
        0 ->
            { typewriter | toWait = shorterWaitTime, state = Erasing }

        n ->
            { typewriter | toWait = n - 1 }



-- A small pause before starting to type out the next word


waitWith : Typewriter -> Typewriter
waitWith typewriter =
    case typewriter.toWait of
        0 ->
            { typewriter | toWait = waitTime, state = Typing }

        n ->
            { typewriter | toWait = n - 1 }


update : Typewriter -> Typewriter
update typewriter =
    case typewriter.state of
        Typing ->
            write typewriter

        Erasing ->
            erase typewriter

        Showing ->
            showText typewriter

        WaitingToType ->
            waitWith typewriter
