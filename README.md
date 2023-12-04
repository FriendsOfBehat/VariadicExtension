# Variadic Extension [![License](https://img.shields.io/packagist/l/friends-of-behat/variadic-extension.svg)](https://packagist.org/packages/friends-of-behat/variadic-extension) [![Version](https://img.shields.io/packagist/v/friends-of-behat/variadic-extension.svg)](https://packagist.org/packages/friends-of-behat/variadic-extension) ![Build](https://github.com/FriendsOfBehat/VariadicExtension/workflows/Build/badge.svg) [![Scrutinizer Quality Score](https://img.shields.io/scrutinizer/g/FriendsOfBehat/VariadicExtension.svg)](https://scrutinizer-ci.com/g/FriendsOfBehat/VariadicExtension/)

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

3. You can use variadic arguments in steps definitions!

    ```php
    /**
     * @Given the store has( also) :firstProductName and :secondProductName products
     * @Given the store has( also) :firstProductName, :secondProductName and :thirdProductName products
     * @Given the store has( also) :firstProductName, :secondProductName, :thirdProductName and :fourthProductName products
     */
    public function theStoreHasProducts(...$productsNames)
    {
        foreach ($productsNames as $productName) {
            $this->saveProduct($this->createProduct($productName));
        }
    }
   
   /**
     * @Given /^(this channel) has "([^"]+)", "([^"]+)", "([^"]+)" and "([^"]+)" products$/
     */
    public function thisChannelHasProducts(ChannelInterface $channel, ...$productsNames)
    {
        foreach ($productsNames as $productName) {
            $product = $this->createProduct($productName, 0, $channel);

            $this->saveProduct($product);
        }
    }
    ```
