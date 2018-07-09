#!/bin/bash

# We will imagine this interface:
# interface animal {
#   speak()
#   move()
# }

# We will implement the interface twice: for bird and for dog.
# Implementation is just creating a function bird_x for each method
# in the previous interface to implement 'bird'. The same will be
# repeated for dog.

# Implement 'bird'
function bird_speak {
    echo "I sing!"
}

function bird_move {
    echo "I fly"
}

#Implement 'dog'
function dog_speak {
    echo "I bark!"
}

function dog_move {
    echo "I run."
}

# We will add a factory function. It returns just 'bird' or 'dog'
# or shuts the script down in unable to create one of the two.

function createAnimal {
    case ${1} in
    
        "bulldog" |\
        "chihuahua" |\
        "setter" )
            echo -n "dog"
            ;;
            
        "owl" |\
        "parrot" |\
        "pidgeon" )
            echo -n "bird"
            ;;
            
        *)
            exit 1
            ;;
    esac
}


# Now, we'll use our code polymorphically.

animal=`createAnimal ${1}`
if [ "$?" -ne 0 ]; then
    echo "Failed to create animal" >&2
    exit 1
fi

${animal}_move
${animal}_speak

exit 0


