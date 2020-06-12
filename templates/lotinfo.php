  <main>
    <nav class="nav">
      <ul class="nav__list container">   
      <?php foreach ($categories as $cat): ?>
        <li class="nav__item">
          <a href="pages/<?= $cat['id']; ?>"><?=htmlspecialchars($cat['category']); ?></a>
        </li>
      <?php endforeach; ?>
      </ul>
    </nav>
    <section class="lot-item container">
    <?php if ($lot): ?>
      <h2><?=htmlspecialchars($lot['lot_name']); ?></h2>
      <div class="lot-item__content">
        <div class="lot-item__left">
          <div class="lot-item__image">
            <img src="../<?=htmlspecialchars($lot['image_link']); ?>" width="730" height="548" alt="">
          </div>
            <p class="lot-item__category">Категория: <span><?=$lot['category']; ?></span></p>
            <p class="lot-item__description"><?=htmlspecialchars($lot['lot_info']); ?></p>
          </div>
          <div class="lot-item__right">
            <div class="lot-item__state">
              <div class="lot-item__timer timer <?php if(getDateRange($lot['final_date'])[0] == '00'): ?>timer--finishing<?php endif; ?>">
                <?=implode(":", getDateRange($lot['final_date'])); ?>
              </div>
              <div class="lot-item__cost-state">
                <div class="lot-item__rate">
                  <span class="lot-item__amount"><?=isset($lot['rate']) ? "Текущая цена" : "Стартовая цена"; ?></span>
                  <span class="lot-item__cost"><?=isset($lot['rate']) ? formatSum(htmlspecialchars($lot['rate'])) : formatSum(htmlspecialchars($lot['start_price'])); ?></span>
                </div>
              <div class="lot-item__min-cost">
                Мин. ставка <span><?=isset($lot['rate']) ? formatSum(htmlspecialchars($lot['rate'] + $lot['step_rate'])) . ' p' : formatSum(htmlspecialchars($lot['start_price'] + $lot['step_rate'])) . ' p'; ?></span>
              </div>
            </div>
          </div>
        </div>
    <?php else: ?>
      <h1><?=http_response_code(); ?></h1>
    <?php endif; ?>
    </section>
  </main>