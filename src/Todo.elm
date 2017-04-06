port module Todo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.Keyed as Keyed
import Html.Lazy exposing (lazy, lazy2)
import Http
import Json.Decode as Decode
import String

main : Program Never Model Msg
main =
    Html.program
        { init = init (Just emptyModel)
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }

-- MODEL

-- The full application state of our todo app.
type alias Model =
    { field : String
    , displayField : String
    }

emptyModel : Model
emptyModel =
    { field = ""
    , displayField = ""
    }

init : Maybe Model -> ( Model, Cmd Msg )
init savedModel =
    Maybe.withDefault emptyModel savedModel ! []

-- UPDATE

type Msg
    = NoOp
    | UpdateField String
    | GetModified String
    | ModifiedText (Result Http.Error String)


-- How we update our Model on a given Msg?
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []

        UpdateField str ->
            { model | field = str }
                ! []

        ModifiedText (Ok str) ->
            { model | displayField = str }
                ! []

        ModifiedText (Err _) -> (model, Cmd.none)

        GetModified str -> (model, (getModified model.field))

-- VIEW

view : Model -> Html Msg
view model =
    div
        [ class "my-class"
        , style [ ]
        ]
        [ section
            [ class "my-class-2" ]
            [ lazy viewInput model.field
            ]
        , section [] [ text model.displayField ]
        ]

viewInput : String -> Html Msg
viewInput task =
    header
        [ class "header" ]
        [ h1 [] [ text "transform text" ]
        , input
            [ class "input-class"
            , placeholder "Text to transform"
            , autofocus True
            , value task
            , name "transform text"
            , onInput UpdateField
            , onEnter (GetModified task)
            ]
            []
        , button [ onClick (GetModified task)] [ text "Transform!" ]
        ]

onEnter : Msg -> Attribute Msg
onEnter msg =
    let
        isEnter code =
            if code == 13 then
                Decode.succeed msg
            else
                Decode.fail "not ENTER"
    in
        on "keydown" (Decode.andThen isEnter keyCode)


getModified : String -> Cmd Msg
getModified txt =
    let
        url = "http://localhost:8081/transform?txt=" ++ txt
    in
        Http.send ModifiedText (Http.get url decodeModified)

decodeModified : Decode.Decoder String
decodeModified = Decode.at ["msg"] Decode.string
