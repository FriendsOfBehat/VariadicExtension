# Variadic Extension [![License](https://img.shields.io/packagist/l/friends-of-behat/variadic-extension.svg)](https://packagist.org/packages/friends-of-behat/variadic-extension) [![Version](https://img.shields.io/packagist/v/friends-of-behat/variadic-extension.svg)](https://packagist.org/packages/friends-of-behat/variadic-extension) [![Build](https://github.com/FriendsOfBehat/VariadicExtension/actions/workflows/build.yml/badge.svg)](https://github.com/FriendsOfBehat/VariadicExtension/actions/workflows/build.yml) [![Scrutinizer Quality Score](https://img.shields.io/scrutinizer/g/FriendsOfBehat/VariadicExtension.svg)](https://scrutinizer-ci.com/g/FriendsOfBehat/VariadicExtension/)

Adds variadic arguments support to Behat steps definitions.

## The why

In Behat, if you want a step definition to accept different numbers of arguments, you normally have to define separate methods for each variation.
This quickly becomes repetitive and hard to maintain as the number of argument combinations grows.

This extension solves that by letting you use PHP's variadic syntax (`...$args`) in your step definitions.
A single method can capture many argument variations, keeping your context classes clean and concise.

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

    or if you use a PHP-based configuration:

    ```php
    # behat.php
    use Behat\Config\Config;
    use Behat\Config\Extension;
    use Behat\Config\Profile;
    use FriendsOfBehat\VariadicExtension\ServiceContainer\VariadicExtension;

    return (new Config())
        ->withProfile(
            (new Profile('default'))
                ->withExtension(new Extension(VariadicExtension::class))
        );
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
     * @Given /^(this channel) has "([^"]+)" and "([^"]+)" products$/
     * @Given /^(this channel) has "([^"]+)", "([^"]+)" and "([^"]+)" products$/
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
