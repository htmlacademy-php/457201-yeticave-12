  <main class="container">
    <section class="promo">
      <h2 class="promo__title">Нужен стафф для катки?</h2>
      <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
      <ul class="promo__list">
      <?php foreach ($categories as $category): ?>
        <li class="promo__item promo__item--<?=$category['code']; ?>">
          <a class="promo__link" href="categories.php?id=<?=$category['id']; ?>"><?=$category['category']; ?></a>
        </li>
      <?php endforeach; ?>
      </ul>
    </section>
    <section class="lots">
      <div class="lots__header">
        <h2>Открытые лоты</h2>
      </div>
      <?=$lots; ?>
    </section>
  </main>
