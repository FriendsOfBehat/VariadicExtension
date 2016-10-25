# Variadic Extension [![License](https://img.shields.io/packagist/l/friends-of-behat/variadic-extension.svg)](https://packagist.org/packages/friends-of-behat/variadic-extension) [![Version](https://img.shields.io/packagist/v/friends-of-behat/variadic-extension.svg)](https://packagist.org/packages/friends-of-behat/variadic-extension) [![Build status on Linux](https://img.shields.io/travis/FriendsOfBehat/VariadicExtension/master.svg)](http://travis-ci.org/FriendsOfBehat/VariadicExtension) [![Scrutinizer Quality Score](https://img.shields.io/scrutinizer/g/FriendsOfBehat/VariadicExtension.svg)](https://scrutinizer-ci.com/g/FriendsOfBehat/VariadicExtension/)

Adds variadic arguments support to Behat steps definitions.

## Usage

1. Install it:
    
    ```bash
    $ composer require friends-of-behat/variadic-extension --dev
    ```

2. Enable it in your Behat configuration:
    
    ```yaml
    # behat.yml
    default:
        # ...
        extensions:
            FriendsOfBehat\VariadicExtension: ~
    ```

3. Boom! :boom: Your Behat contexts are able to use variadic arguments in steps definitions!
