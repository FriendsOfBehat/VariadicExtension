Feature: Using variadic in behat context
    In order to make behat contexts cleaner and more readable
    As a Behat developer
    I want to have a variadic support in Behat context

    Background:
        Given a context file "features/bootstrap/FeatureContext.php" containing:
        """
        <?php
        use Behat\Behat\Context\Context;
        class FeatureContext implements Context
        {
            /**
             * @When I use a step with :two :arguments
             * @When I use another step :with :three :arguments
             */
            public function iUseAStepWith(...$variadic)
            {
                echo sprintf('Number of passed arguments: %d', count($variadic));
            }
        }
        """

    Scenario: Enabled variadic support
        Given a Behat configuration containing:
        """
        default:
            extensions:
                FriendsOfBehat\VariadicExtension: ~
        """
        And a feature file "features/enabled_variadic_support.feature" containing:
        """
        Feature: Enabled variadic support feature
            Scenario: Enabled variadic support scenario
                When I use a step with two arguments
        """
        When I run Behat
        Then it should pass with "Number of passed arguments: 2"

    Scenario: Enabled variadic reduce code duplication
        Given a Behat configuration containing:
        """
        default:
            extensions:
                FriendsOfBehat\VariadicExtension: ~
        """
        And a feature file "features/enabled_variadic_support.feature" containing:
        """
        Feature: Enabled variadic support feature
            Scenario: Enabled variadic support scenario
                When I use another step with three arguments
        """
        When I run Behat
        Then it should pass with "Number of passed arguments: 3"

    Scenario: Disabled variadic support
        And a feature file "features/enabled_variadic_support.feature" containing:
        """
        Feature: Enabled variadic support feature
            Scenario: Enabled variadic support scenario
                When I use a step with two arguments
        """
        When I run Behat
        Then it should pass with "Number of passed arguments: 1"
