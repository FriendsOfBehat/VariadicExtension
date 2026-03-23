Feature: Transforming variadic arguments in step definitions
    In order to make Behat steps definitions cleaner and more readable
    As a Behat User
    I want to have transformed variadic arguments in these

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
             * @Transform /^(\w+)$/
             */
            public function transform($string)
            {
                return strtoupper($string);
            }

            /**
             * @When /^I pass "(\w+)" and "(\w+)" as arguments$/
             * @When I pass :firstArgument, :secondArgument and :thirdArgument
             */
            public function iPass(...$arguments)
            {
                printf('Arguments: %s', join(', ', $arguments));
            }
        }
        """

    Scenario: Transforming variadic arguments in step definitions with a regex
        Given a feature file "features/variadic_arguments_support.feature" containing:
        """
        Feature: Transforming variadic arguments in step definitions

            Scenario: Transforming variadic arguments in step definitions
                When I pass "foo" and "bar" as arguments
        """
        When I run Behat
        Then it should pass with "Arguments: FOO, BAR"

    Scenario: Transforming variadic arguments in step definitions without regex
        Given a feature file "features/variadic_arguments_support.feature" containing:
        """
        Feature: Transforming variadic arguments in step definitions

            Scenario: Transforming variadic arguments in step definitions
                When I pass "one", "two" and "three"
        """
        When I run Behat
        Then it should pass with "Arguments: ONE, TWO, THREE"
