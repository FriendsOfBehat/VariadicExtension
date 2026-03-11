Feature: Using variadic arguments in Behat steps definitions with not named parameters
    In order to make Behat steps definitions cleaner and more readable
    As a Behat User
    I want to use variadic arguments in these

    Background:
        Given a Behat configuration containing:
        """
        default:
            extensions:
                FriendsOfBehat\VariadicExtension: ~
        """
        And a context file "features/bootstrap/FeatureContext.php" containing:
        """
        <?php

        use Behat\Behat\Context\Context;

        class FeatureContext implements Context
        {
            /**
             * @When /^I pass "(\w+)" and "(\w+)" as arguments$/
             * @When /^I pass "(\w+)", "(\w+)" and "(\w+)" as arguments$/
             */
            public function iPass(...$arguments)
            {
                printf('Number of passed arguments: %d', count($arguments));
            }
        }
        """

    Scenario: Using two variadic arguments as the only ones
        Given a feature file "features/variadic_arguments_support.feature" containing:
        """
        Feature: Passing arguments

            Scenario: Passing two arguments
                When I pass "foo" and "bar" as arguments
        """
        When I run Behat
        Then it should pass with "Number of passed arguments: 2"

    Scenario: Using three variadic arguments as the only ones
        Given a feature file "features/variadic_arguments_support.feature" containing:
        """
        Feature: Passing arguments

            Scenario: Passing three arguments
                When I pass "foo", "bar" and "baz" as arguments
        """
        When I run Behat
        Then it should pass with "Number of passed arguments: 3"
