<?php

declare(strict_types=1);

/*
 * This file is part of the VariadicExtension package.
 *
 * (c) Kamil Kokot <kamil@kokot.me>
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

final class VariadicExtension implements Extension
{
    /**
     * {@inheritdoc}
     */
    public function getConfigKey(): string
    {
        return 'fob_variadic';
    }

    /**
     * {@inheritdoc}
     */
    public function initialize(ExtensionManager $extensionManager): void
    {
    }

    /**
     * {@inheritdoc}
     */
    public function configure(ArrayNodeDefinition $builder): void
    {
    }

    /**
     * {@inheritdoc}
     */
    public function load(ContainerBuilder $container, array $config): void
    {
        $definition = new Definition(VariadicArgumentOrganiser::class, [
            new Reference('fob_variadic.argument.mixed_organiser.inner'),
        ]);
        $definition->setDecoratedService(ArgumentExtension::MIXED_ARGUMENT_ORGANISER_ID);

        $container->setDefinition('fob_variadic.argument.mixed_organiser', $definition);
    }

    /**
     * {@inheritdoc}
     */
    public function process(ContainerBuilder $container): void
    {
    }
}
