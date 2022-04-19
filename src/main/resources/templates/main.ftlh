<#import "parts/common.ftlh" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>

<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new Advertation
</a>
<div class="collapse <#if advert??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                       value="<#if advert??>${advert.title}</#if>" name="title" placeholder="Введите текст" />
                <#if titleError??>
                <div class="invalid-feedback">
                    ${titleError}
                </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control"
                       value="<#if advert??>${advert.description}</#if>" name="description" placeholder="Описание">
                <#if descriptionError??>
                    <div class="invalid-feedback">
                        ${descriptionError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>

<div class="card-columns">
    <#list messages as advert>
    <div class="card my-3">
        <#if advert.filename??>
        <img src="/img/${advert.filename}" class="card-img-top">
        </#if>
        <div class="m-2">
            <span>${advert.title}</span>
            <i>${advert.description}</i>
        </div>
        <div class="card-footer text-muted">
            ${advert.authorName}
        </div>
    </div>
    <#else>
    No advert
    </#list>
</div>
</@c.page>
