  <main>
    <?=$menu; ?>
    <form class="form container <?=isset($errors) ? "form--invalid" : ""; ?>" action="login.php" method="POST" enctype="multipart/form-data">
      <h2>Вход</h2>
      <div class="form__item <?=isset($errors['email']) ? "form__item--invalid" : ""; ?>">
        <label for="email">E-mail <sup>*</sup></label>
        <input id="email" type="text" name="email" placeholder="Введите e-mail" value="<?=htmlspecialchars(getPostVal('email')); ?>">
        <span class="form__error"><?=$errors['email']; ?></span>
      </div>
      <div class="form__item form__item--last <?=isset($errors['password']) ? "form__item--invalid" : ""; ?>">
        <label for="password">Пароль <sup>*</sup></label>
        <input id="password" type="password" name="password" placeholder="Введите пароль" value="<?=htmlspecialchars(getPostVal('password')); ?>">
        <span class="form__error"><?=$errors['password']; ?></span>
      </div>
      <button type="submit" class="button">Войти</button>
    </form>
  </main>
