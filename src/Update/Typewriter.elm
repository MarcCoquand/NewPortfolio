module Update.Typewriter exposing (waitTime, shorterWaitTime, nextState)

import Types.Types exposing (..)


-- The amount of time that you want to display a message


waitTime : Int
waitTime =
    40



-- The wait time before the typewriter should start typing


shorterWaitTime : Int
shorterWaitTime =
    20


writeLetter : Typewriter -> Typewriter
writeLetter typewriter =
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


eraseLetter : Typewriter -> Typewriter
eraseLetter typewriter =
    if String.isEmpty typewriter.toShow then
        case typewriter.statements of
            head :: tail ->
                { typewriter
                    | toWrite = head
                    , state = WaitingToType
                    , statements = tail ++ [ head ]
                }

            otherwise ->
                typewriter
    else
        { typewriter | toShow = String.dropRight 1 typewriter.toShow }



-- A small pause before erasing the word so people can read what is written


tickShowTimer : Typewriter -> Typewriter
tickShowTimer typewriter =
    case typewriter.toWait of
        0 ->
            { typewriter | toWait = shorterWaitTime, state = Erasing }

        n ->
            { typewriter | toWait = n - 1 }



-- A small pause before starting to type out the next word


tickBreakTimer : Typewriter -> Typewriter
tickBreakTimer typewriter =
    case typewriter.toWait of
        0 ->
            { typewriter | toWait = waitTime, state = Typing }

        n ->
            { typewriter | toWait = n - 1 }


nextState : Typewriter -> Typewriter
nextState typewriter =
    case typewriter.state of
        Typing ->
            writeLetter typewriter

        Erasing ->
            eraseLetter typewriter

        Showing ->
            tickShowTimer typewriter

        WaitingToType ->
            tickBreakTimer typewriter
