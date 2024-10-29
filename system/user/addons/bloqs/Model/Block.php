<?php

/**
 * @package     ExpressionEngine
 * @subpackage  Extensions
 * @category    Bloqs
 * @author      Brian Litzinger
 * @copyright   Copyright (c) 2012, 2019 - BoldMinded, LLC
 * @link        http://boldminded.com/add-ons/bloqs
 * @license
 *
 * Copyright (c) 2019. BoldMinded, LLC
 * All rights reserved.
 *
 * This source is commercial software. Use of this software requires a
 * site license for each domain it is used on. Use of this software or any
 * of its source code without express written permission in the form of
 * a purchased commercial or other license is prohibited.
 *
 * THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
 * PARTICULAR PURPOSE.
 *
 * As part of the license agreement for this software, all modifications
 * to this source must be submitted to the original author for review and
 * possible inclusion in future releases. No compensation will be provided
 * for patches, although where possible we will attribute each contribution
 * in file revision notes. Submitting such modifications constitutes
 * assignment of copyright to the original author (Brian Litzinger and
 * BoldMinded, LLC) for such modifications. If you do not wish to assign
 * copyright to the original author, your license to  use and modify this
 * source is null and void. Use of this software constitutes your agreement
 * to this clause.
 */

namespace BoldMinded\Bloqs\Model;

use BoldMinded\Bloqs\Controller\TagOutputBlockContext;

class Block
{
    const PREFIX_NEW_BLOCK_ID = 'blocks_new_block_';
    const PREFIX_EXISTING_BLOCK_ID = 'blocks_block_id_';

    // Properties should be marked as private, but for backwards compatibility keeping as public

    /**
     * @var int
     */
    public $id;

    /**
     * @var int
     */
    public $order;

    /**
     * @var int
     */
    public $depth;

    /**
     * @var int
     */
    public $lft;

    /**
     * @var int
     */
    public $rgt;

    /**
     * @var int
     */
    public $parent_id = 0;

    /**
     * @var BlockDefinition
     */
    public $definition;

    /**
     * @var Atom[] array
     */
    public $atoms = [];

    /**
     * @var array
     */
    public $children = [];

    /**
     * @var bool
     */
    public $deleted = false;

    /**
     * @var bool
     */
    public $isNew = false;

    /**
     * @var string
     */
    public $originalBlockName = '';

    /**
     * @var string
     */
    public $prefix = '';

    /**
     * @var string
     */
    public $revisionId;

    /**
     * @var bool
     */
    public $draft = 0;

    /**
     * @var int
     */
    public $cloneable = 0;

    /**
     * @var int
     */
    private $componentDefinitionId = 0;

    /**
     * @var TagOutputBlockContext
     */
    private $context;

    /**
     * @param string $name
     * @return string
     */
    public function __get(string $name = ''): string
    {
        return $this->getAtom($name);
    }

    /**
     * @param string $name
     * @return bool
     */
    public function __isset(string $name = ''): bool
    {
        return isset($this->atoms[$name]);
    }

    /**
     * @param string $name
     * @return string
     */
    public function getAtom(string $name = ''): string
    {
        if (isset($this->atoms[$name])) {
            return $this->atoms[$name]->getValue();
        }

        return '';
    }

    /**
     * @param $context
     * @return Block
     */
    public function setContext(TagOutputBlockContext $context): Block
    {
        $this->context = $context;

        return $this;
    }

    /**
     * @return TagOutputBlockContext
     */
    public function getContext(): TagOutputBlockContext
    {
        return $this->context;
    }

    /**
     * @param Block $child
     */
    public function addChild(Block $child)
    {
        $this->children[] = $child;
    }

    /**
     * @return bool
     */
    public function hasChildren(): bool
    {
        return count($this->children) > 0 ? true : false;
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param int $id
     * @return $this
     */
    public function setId($id): Block
    {
        $this->id = $id;

        return $this;
    }

    /**
     * @return int
     */
    public function getOrder()
    {
        return $this->order;
    }

    /**
     * @param int $order
     * @return $this
     */
    public function setOrder($order): Block
    {
        $this->order = $order;

        return $this;
    }

    /**
     * @return int
     */
    public function getDepth()
    {
        return $this->depth;
    }

    /**
     * @param int $depth
     * @return $this
     */
    public function setDepth($depth): Block
    {
        $this->depth = $depth;

        return $this;
    }

    /**
     * @return int
     */
    public function getLft()
    {
        return $this->lft;
    }

    /**
     * @param int $lft
     * @return $this
     */
    public function setLft($lft): Block
    {
        $this->lft = $lft;

        return $this;
    }

    /**
     * @return int
     */
    public function getRgt()
    {
        return $this->rgt;
    }

    /**
     * @param int $rgt
     * @return $this
     */
    public function setRgt($rgt): Block
    {
        $this->rgt = $rgt;

        return $this;
    }

    /**
     * @return int
     */
    public function getParentId()
    {
        return $this->parent_id;
    }

    /**
     * @param int $parent_id
     * @return $this
     */
    public function setParentId($parent_id): Block
    {
        $this->parent_id = $parent_id;

        return $this;
    }

    /**
     * @return BlockDefinition
     */
    public function getDefinition()
    {
        return $this->definition;
    }

    /**
     * @param BlockDefinition $definition
     * @return $this
     */
    public function setDefinition($definition): Block
    {
        $this->definition = $definition;

        return $this;
    }

    /**
     * @return Atom[]
     */
    public function getAtoms()
    {
        return $this->atoms;
    }

    /**
     * @param Atom[] $atoms
     * @return $this
     */
    public function setAtoms($atoms): Block
    {
        $this->atoms = $atoms;

        return $this;
    }

    /**
     * @param $shortName
     * @param $definition
     * @return $this
     */
    public function addAtom($shortName, $definition): Block
    {
        $this->atoms[$shortName] = $definition;

        return $this;
    }

    /**
     * @return array
     */
    public function getChildren()
    {
        return $this->children;
    }

    /**
     * @return int
     */
    public function getTotalChildren(): int
    {
        return count($this->children);
    }

    /**
     * @param array $children
     * @return $this
     */
    public function setChildren($children): Block
    {
        $this->children = $children;

        return $this;
    }

    /**
     * @return bool
     */
    public function isDeleted()
    {
        return $this->deleted;
    }

    /**
     * @param bool $deleted
     * @return $this
     */
    public function setDeleted($deleted): Block
    {
        $this->deleted = $deleted;

        return $this;
    }

    /**
     * @return bool
     */
    public function isNew()
    {
        return $this->isNew;
    }

    /**
     * @param bool $isNew
     * @return $this
     */
    public function setIsNew($isNew): Block
    {
        $this->isNew = $isNew;

        return $this;
    }

    /**
     * @return string
     */
    public function getOriginalBlockName(): string
    {
        return $this->originalBlockName;
    }

    /**
     * @param string $originalBlockName
     * @return $this
     */
    public function setOriginalBlockName(string $originalBlockName): Block
    {
        $this->originalBlockName = $originalBlockName;

        return $this;
    }

    /**
     * @return string
     */
    public function getPrefix()
    {
        return $this->prefix;
    }

    /**
     * @param string $prefix
     * @return $this
     */
    public function setPrefix($prefix): Block
    {
        $this->prefix = $prefix;

        return $this;
    }

    /**
     * @return string
     */
    public function getRevisionId()
    {
        return $this->revisionId;
    }

    /**
     * @param string $revisionId
     * @return $this
     */
    public function setRevisionId($revisionId): Block
    {
        $this->revisionId = $revisionId;

        return $this;
    }

    /**
     * @param $data
     * @return $this
     */
    public function setTreeData($data)
    {
        $this->setOrder($data['order']);
        $this->setParentId($data['parent_id']);
        $this->setDepth($data['depth']);
        $this->setLft($data['lft']);
        $this->setRgt($data['rgt']);

        return $this;
    }

    /**
     * @return array
     */
    public function getTreeData(): array
    {
        return [
            'order' => $this->getOrder(),
            'parent_id' => $this->getParentId(),
            'depth' => $this->getDepth(),
            'lft' => $this->getLft(),
            'rgt' => $this->getRgt(),
        ];
    }

    /**
     * @return bool
     */
    public function isDraft(): bool
    {
        return $this->draft === 1;
    }

    /**
     * @param int $draft
     * @return Block
     */
    public function setDraft($draft): Block
    {
        $this->draft = $draft;

        return $this;
    }

    /**
     * @return bool
     */
    public function isCloneable(): bool
    {
        return $this->cloneable === 1;
    }

    /**
     * @param bool $isCloneable
     * @return Block
     */
    public function setCloneable($cloneable): Block
    {
        $this->cloneable = $cloneable;

        return $this;
    }

    /**
     * @return int
     */
    public function getComponentDefinitionId(): int
    {
        return $this->componentDefinitionId;
    }

    /**
     * @param int $componentId
     * @return Block
     */
    public function setComponentDefinitionId(int $componentDefinitionId): Block
    {
        $this->componentDefinitionId = $componentDefinitionId;

        return $this;
    }

    /**
     * @param string|int $id
     * @return bool
     */
    public static function isNewBlock($id): bool
    {
        return strpos($id, self::PREFIX_NEW_BLOCK_ID) === 0;
    }

    /**
     * @param string|int $id
     * @return bool
     */
    public static function isExistingBlock($id): bool
    {
        return strpos($id, self::PREFIX_EXISTING_BLOCK_ID) === 0;
    }
}
