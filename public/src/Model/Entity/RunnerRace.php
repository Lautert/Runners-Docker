<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * RunnerRace Entity
 *
 * @property int $id
 * @property int $id_runner
 * @property int $id_racing_event
 * @property \Cake\I18n\FrozenTime|null $dt_created
 * @property \Cake\I18n\FrozenTime|null $dt_modified
 * @property bool $bl_active
 */
class RunnerRace extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    protected $_accessible = [
        'id_runner' => true,
        'id_racing_event' => true,
        'dt_created' => true,
        'dt_modified' => true,
        'bl_active' => true,
    ];
}
