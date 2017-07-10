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

namespace FriendsOfBehat\VariadicExtension\Argument;

use Behat\Testwork\Argument\ArgumentOrganiser;
use ReflectionFunctionAbstract;

/**
 * Decorates a default argument organiser to support a variadic arguments also.
 * It will add all unused arguments to the end of argument list.
 */
final class VariadicArgumentOrganiser implements ArgumentOrganiser
{
    /**
     * @var ArgumentOrganiser
     */
    private $decoratedArgumentOrganiser;

    /**
     * @param ArgumentOrganiser $decoratedArgumentOrganiser
     */
    public function __construct(ArgumentOrganiser $decoratedArgumentOrganiser)
    {
        $this->decoratedArgumentOrganiser = $decoratedArgumentOrganiser;
    }

    /**
     * {@inheritdoc}
     */
    public function organiseArguments(ReflectionFunctionAbstract $function, array $arguments): array
    {
        $organisedArguments = $this->decoratedArgumentOrganiser->organiseArguments($function, $arguments);

        if ($function->isVariadic()) {
            $organisedArguments += array_diff($arguments, $organisedArguments);
        }

        return $organisedArguments;
    }
}
