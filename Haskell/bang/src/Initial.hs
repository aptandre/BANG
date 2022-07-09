-- módulo responsável por iniciar certos objetos
-- cria objetos como base para iniciar a aplicação 
module Initial where

import           GameModel
import           GameState
import           ObstaclesModel
import           PokemonModel

-- cria o jogo base para ínicio da aplicação
initialState :: BANG
initialState = Game { gameState  = Menu
                    , bulbasaur  = initializeBulbasur
                    , charmander = initializeCharmander
                    , winner     = ""
                    , time       = 0.0
                    , vileplums  = getVileplums
                    , slowpokes  = getSlowpokes
                    , stones     = getStones
                    }

-- cria o Player 1 base para ínicio da aplicação
initializeBulbasur :: Pokemon
initializeBulbasur = Pokemon { life     = 100
                             , name     = "Bulbasaur"
                             , location = (-525, 0)
                             , onShoot  = initializePokeball
                             , hasFired = False
                             }

-- cria o Player 2 base para ínicio da aplicação
initializeCharmander :: Pokemon
initializeCharmander = Pokemon { life     = 100
                               , name     = "Charmander"
                               , location = (525, 0)
                               , onShoot  = initializePokeball
                               , hasFired = False
                               }

initializePokeball :: Pokeball
initializePokeball =
    Pokeball { damage = 100, speed = (4, 0), locationPokeball = (-10000, 0) }

getVileplums :: [VilePlum]
getVileplums =
    [ VilePlum { vilePlumName     = "vileplum"
               , vilePlumLife     = 100
               , vilePlumShoot    = initializeSpike
               , vilePlumLocation = (400, 50)
               }
    ]

getSlowpokes :: [SlowPoke]
getSlowpokes =
    [ SlowPoke { slowPokeName     = "slowpoke"
               , slowPokeLife     = 100
               , slowPokeLocation = (-200, 100)
               }
    , SlowPoke { slowPokeName     = "slowpoke"
               , slowPokeLife     = 100
               , slowPokeLocation = (200, -100)
               }
    ]

getStones :: [Stone]
getStones =
    [ Stone { stoneName = "stone", stoneLife = 100, stoneLocation = (0, 0) }
    , Stone { stoneName = "stone", stoneLife = 100, stoneLocation = (100, 100) }
    ]


initializeSpike :: Spike
initializeSpike = Spike { spikeDamage   = 100
                        , spikeLocation = (-10000, 0)
                        , spikeSpeed    = (10, 10)
                        }

initializeCollision :: Collision
initializeCollision = Collision { obstacleType      = ""
                                , collisionLocation = (0, 0)
                                , pokemonCollided   = initializeCharmander
                                }

