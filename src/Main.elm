import Html exposing (Html, div, node, section, text)
import Slides exposing (..)

main : Program Never Model Msg
main = Slides.app

    slidesDefaultOptions

    [ md
        """
        # Elm For A Better Tomorrow
        _(at least on the front end)_

        Trevis Elser (trevis.elser at manheim.com)
        """

    , outline
    , whatIs
    , history
    , example
    , tooling
    , ecosystem
    , comparisons
    , typescriptElmAdvantage
    , typescriptElmTSAdvantage
    , example
    , thankyou
    , bonus
    ]

outline : Slide
outline = mdFragments
          [ "## Outline"
          , "#### What is Elm?"
          , "#### Where does Elm Come From?"
          , "#### Example App #1"
          , "#### Elm Tools"
          , "#### Ecosystem Support"
          , "#### Comparing To Other Languages"
          , "#### Example App #2"
          , "#### Bonus"
          ]

whatIs : Slide
whatIs = mdFragments
          [ "# What is Elm?"
          , "A strongly typed, functional, compile to Javascript language."
          , "Good interop with Javascript, embedable (ie. you can use it today!)"
          , "Semantic versioning enforced in the package index"
          ]

history : Slide
history = mdFragments
          [ "# Where does Elm Come From?"
          ]

example : Slide
example = mdFragments
          [ "# Example"
          ]

tooling : Slide
tooling = mdFragments
          [ "# Tooling"
          , "Elm-package"
          , "Elm-reactor"
          , "Elm-format"
          ]

ecosystem : Slide
ecosystem = mdFragments
               [ "# Ecosystem Support"
               , "Editors: Emacs, Vim, Atom, VSCode, IntelliJ IDEA, LightTable, Sublime(probably more)"
               , "Use with React: https://github.com/evancz/react-elm-components"
               , "Use with Angular2: https://github.com/camargo/ng-elm"
               ]

comparisons : Slide
comparisons = mdFragments
               [ "# Comparing to other languages"
               ]

typescriptElmAdvantage : Slide
typescriptElmAdvantage = mdFragments
                         [ "## Elm vs Typescript"
                         , "### Elm Advantages"
                         , "* Semantic versioning enforced at package level"
                         , "* More helpful compiler messages"
                         , "* Cleaner syntax (ie. less usage of {})"
                         , "* Immutability at the language, not library, level"

                         ]
typescriptElmTSAdvantage : Slide
typescriptElmTSAdvantage = mdFragments
                         [ "## Elm vs Typescript"
                         , "### Typescript Advantages"
                         , "* Microsoft"
                         , "* Feels more like JS"
                         ]

purescriptElmAdvantage : Slide
purescriptElmAdvantage = mdFragments
                         [ "## Elm vs Purescript"
                         , "### Elm Advantages"
                         , "* Semantic versioning enforced at package level"
                         , "* Package system as a whole"
                         , "* More helpful compiler messages"
                         , "* Language focus on approachability"
                         ]

purescriptElmPSCAdvantage : Slide
purescriptElmPSCAdvantage = mdFragments
                           [ "## Elm vs Purescript"
                           , "### Purescript Advantages"
                           , "* Better language features (eg. ad-hoc polymorphism)"
                           , "* Explicit side effect handling (ie functional purity)"
                           , "* Better testing story (strongcheck)"
                           , "* No runtime"
                           , "* Documentation! https://pursuit.purescript.org"
                         ]
thankyou : Slide
thankyou = mdFragments
               [ "# Thank you!"
               ]

bonus : Slide
bonus = mdFragments
               [ "# Bonus!"
               , "This presentation is written in Elm!"
               , "Source code link:"
               ]


type alias Slide =
    { fragments : List (Html Msg)
    }
