<?php

/*
 * This file is part of the VariadicExtension package.
 *
 * (c) FriendsOfBehat
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace FriendsOfBehat\VariadicExtension\ServiceContainer;

use Behat\Testwork\Argument\ServiceContainer\ArgumentExtension;
use Behat\Testwork\ServiceContainer\Extension;
use Behat\Testwork\ServiceContainer\ExtensionManager;
use FriendsOfBehat\VariadicExtension\Argument\VariadicArgumentOrganiser;
use Symfony\Component\Config\Definition\Builder\ArrayNodeDefinition;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Definition;
use Symfony\Component\DependencyInjection\Reference;

/**
 * @author Łukasz Chruściel <lchrusciel@gmail.com>
 */
final class VariadicExtension implements Extension
{
    const DECORATING_MIXED_ARGUMENT_ORGANISER_ID = ArgumentExtension::MIXED_ARGUMENT_ORGANISER_ID . '.decorating';
    const DECORATED_MIXED_ARGUMENT_ORGANISER_ID = ArgumentExtension::MIXED_ARGUMENT_ORGANISER_ID . '.decorated';

    /**
     * {@inheritdoc}
     */
    public function getConfigKey()
    {
        return 'fob_variadic_argument';
    }

    /**
     * {@inheritdoc}
     */
    public function initialize(ExtensionManager $extensionManager)
    {
    }

    /**
     * {@inheritdoc}
     */
    public function configure(ArrayNodeDefinition $builder)
    {
    }

    /**
     * {@inheritdoc}
     */
    public function load(ContainerBuilder $container, array $config)
    {
        $definition = new Definition(VariadicArgumentOrganiser::class, [
            new Reference(self::DECORATED_MIXED_ARGUMENT_ORGANISER_ID),
        ]);

        $definition->setDecoratedService(
            ArgumentExtension::MIXED_ARGUMENT_ORGANISER_ID,
            self::DECORATED_MIXED_ARGUMENT_ORGANISER_ID
        );

        $container->setDefinition(self::DECORATING_MIXED_ARGUMENT_ORGANISER_ID, $definition);
    }

    /**
     * {@inheritdoc}
     */
    public function process(ContainerBuilder $container)
    {
    }
}
