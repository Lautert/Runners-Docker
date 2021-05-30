<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\RacingType $racingType
 */
?>
<div class="row">
    <aside class="column">
        <div class="side-nav">
            <h4 class="heading"><?= __('Actions') ?></h4>
            <?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $racingType->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $racingType->id), 'class' => 'side-nav-item']
            ) ?>
            <?= $this->Html->link(__('List Racing Types'), ['action' => 'index'], ['class' => 'side-nav-item']) ?>
        </div>
    </aside>
    <div class="column-responsive column-80">
        <div class="racingTypes form content">
            <?= $this->Form->create($racingType) ?>
            <fieldset>
                <legend><?= __('Edit Racing Type') ?></legend>
                <?php
                    echo $this->Form->control('ds_type');
                    echo $this->Form->control('dt_created', ['empty' => true]);
                    echo $this->Form->control('dt_modified', ['empty' => true]);
                    echo $this->Form->control('bl_active');
                ?>
            </fieldset>
            <?= $this->Form->button(__('Submit')) ?>
            <?= $this->Form->end() ?>
        </div>
    </div>
</div>
