<?php

declare(strict_types=1);

use Behat\Config\Config;
use Behat\Config\Profile;
use Behat\Config\Suite;
use FriendsOfBehat\TestContext\Context\TestContext;

return (new Config())
    ->withProfile(
        (new Profile('default'))
            ->withSuite(
                (new Suite('default'))
                    ->withPaths(__DIR__ . '/features/attributes')
                    ->withContexts(TestContext::class)
            )
    );
