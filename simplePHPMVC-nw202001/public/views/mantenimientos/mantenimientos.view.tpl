
<header>
  <section class="row1 tittle">
    <div class="col1-sm-12-a">
      <h1>Mantenimiento</h1>
    </div>
  </section>
</header>
<section class="row1">
  {{foreach mantenimientos}}
    <section class="card depth-5 col-sm-12 center ">
      <a class="bg-white button" href="index.php?page={{page}}">
        <div class="ion-{{ionicon}} bigicon"></div>
        <div>{{pageDsc}}</div>
      </a>
    </section>
  {{endfor mantenimientos}}
</section>
<style>
  .button{
    display: block;
    overflow: auto;
    padding: 1em;
    text-decoration: none;
  }
  .bigicon {
    font-size: 3em;
  }
  a.bg-white:hover{
    background-color: #b9b9b9 !important;
  }
</style>
