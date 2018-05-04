<!-- MENUS AND FILTERS-->
<div class="panel panel-default sidebar-menu">
    <div class="panel-heading">
        <h3 class="h4 panel-title">Danh mục</h3>
    </div>
    <div class="panel-body">
        <ul class="nav nav-pills flex-column text-sm category-menu">
            <li class="nav-item"><a href="shop" class="nav-link d-flex align-items-center justify-content-between"><span>Tất cả</span></a>
                <ul class="nav nav-pills flex-column">
		        	@foreach($categories as $category)
		                <li class="nav-item"><a href="shop?category={{ $category->id }}" class="nav-link d-flex align-items-center justify-content-between"><span>{{$category->name}}</span><span class="badge badge-secondary">{{ $category->count }}</span></a></li>
		            @endforeach
                </ul>
            </li>

        </ul>
    </div>
</div>
<!-- <div class="panel panel-default sidebar-menu">
    <div class="panel-heading d-flex align-items-center justify-content-between">
        <h3 class="h4 panel-title">Brands</h3><a href="#" class="btn btn-sm btn-danger"><i class="fa fa-times-circle"></i><span class="d-none d-md-inline-block">Clear</span></a>
    </div>
    <div class="panel-body">
        <form>
            <div class="form-group">
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> Armani (10)
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> Versace (12)
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> Carlo Bruni (15)
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> Jack Honey (14)
                    </label>
                </div>
            </div>
            <button class="btn btn-sm btn-template-outlined"><i class="fa fa-pencil"></i> Apply</button>
        </form>
    </div>
</div>
<div class="panel panel-default sidebar-menu">
    <div class="panel-heading d-flex align-items-center justify-content-between">
        <h3 class="h4 panel-titlen">Colours</h3><a href="#" class="btn btn-sm btn-danger"><i class="fa fa-times-circle"></i><span class="d-none d-md-inline-block">Clear</span></a>
    </div>
    <div class="panel-body">
        <form>
            <div class="form-group">
                <div class="checkbox">
                    <label>
                        <input type="checkbox"><span class="colour white"></span> White (14)
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"><span class="colour blue"></span> Blue (10)
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"><span class="colour green"></span> Green (20)
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"><span class="colour yellow"></span> Yellow (13)
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"><span class="colour red"></span> Red (10)
                    </label>
                </div>
            </div>
            <button class="btn btn-sm btn-template-outlined"><i class="fa fa-pencil"></i> Apply</button>
        </form>
    </div>
</div>
<div class="banner">
    <a href="shop-category.html"><img src="img/banner.jpg" alt="sales 2014" class="img-fluid"></a>
</div> -->