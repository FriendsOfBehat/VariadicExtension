# Variadic Extension

Adds variadic arguments support to Behat steps definitions.

## Usage

1. Install it:
    
    ```bash
    $ composer require friends-of-behat/variadic-extension --dev
    ```

2. Enable it in your Behat configuration:
    
    ```yaml
    default:
        # ...
        extensions:
            FriendsOfBehat\VariadicExtension: ~
    ```

3. Boom! :boom: Your Behat contexts are able to use variadic arguments in steps definitions!
