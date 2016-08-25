Feature: Using variadic arguments in steps definitions with named parameters
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
             * @When I pass :firstArgument and :secondArgument as arguments
             * @When I pass :firstArgument, :secondArgument and :thirdArgument as arguments
             */
            public function iPass(...$arguments)
            {
                printf('Number of passed arguments: %d', count($arguments));
            }
        }
        """

    Scenario: Using two variadic arguments as the only ones
        Given a feature file "features/variadics_arguments_support.feature" containing:
        """
        Feature: Passing arguments

            Scenario: Passing two arguments
                When I pass "foo" and "bar" as arguments
        """
        When I run Behat
        Then it should pass with "Number of passed arguments: 2"

    Scenario: Using three variadic arguments as the only ones
        Given a feature file "features/variadics_arguments_support.feature" containing:
        """
        Feature: Passing arguments

            Scenario: Passing three arguments
                When I pass "foo", "bar" and "baz" as arguments
        """
        When I run Behat
        Then it should pass with "Number of passed arguments: 3"
