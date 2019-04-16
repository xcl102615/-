<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../header/admin.jsp" %>
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-light">
                            Modals
                        </div>

                        <div class="card-body">
                            <div class="mb-4">
                                <p>Basic Modals</p>
                                <button class="btn btn-outline-primary" data-toggle="modal" data-target="#modal-1">Default</button>
                                <button class="btn btn-outline-primary" data-toggle="modal" data-target="#modal-2">Large Modal</button>
                                <button class="btn btn-outline-primary" data-toggle="modal" data-target="#modal-3">Small Modal</button>
                            </div>

                            <hr>
                            <div class="my-4">
                                <p>Colored Headers Modals</p>
                                <button class="btn btn-outline-primary" data-toggle="modal" data-target="#modal-4">Primary</button>
                                <button class="btn btn-outline-success" data-toggle="modal" data-target="#modal-5">Success</button>
                                <button class="btn btn-outline-info" data-toggle="modal" data-target="#modal-6">Info</button>
                                <button class="btn btn-outline-warning" data-toggle="modal" data-target="#modal-7">Warning</button>
                                <button class="btn btn-outline-danger" data-toggle="modal" data-target="#modal-8">Danger</button>
                            </div>

                            <hr>
                            <div class="my-4">
                                <p>Full Color Modals</p>
                                <button class="btn btn-outline-primary" data-toggle="modal" data-target="#modal-9">Primary</button>
                                <button class="btn btn-outline-success" data-toggle="modal" data-target="#modal-10">Success</button>
                                <button class="btn btn-outline-info" data-toggle="modal" data-target="#modal-11">Info</button>
                                <button class="btn btn-outline-warning" data-toggle="modal" data-target="#modal-12">Warning</button>
                                <button class="btn btn-outline-danger" data-toggle="modal" data-target="#modal-13">Danger</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


<div class="modal fade" id="modal-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary border-0">
                <h5 class="modal-title text-white">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body p-5">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer border-0">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Continue</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-success border-0">
                <h5 class="modal-title text-white">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body p-5">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer border-0">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success">Continue</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-6" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-info border-0">
                <h5 class="modal-title text-white">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body p-5">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer border-0">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-info">Continue</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-7" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-warning border-0">
                <h5 class="modal-title text-white">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body p-5">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer border-0">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-warning text-white">Continue</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-8" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-danger border-0">
                <h5 class="modal-title text-white">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body p-5">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer border-0">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger">Continue</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-9" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-primary">
            <div class="modal-header border-0">
                <h5 class="modal-title text-white">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body text-white p-5">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer border-0">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Continue</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-10" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-success">
            <div class="modal-header border-0">
                <h5 class="modal-title text-white">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body text-white p-5">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer border-0">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success">Continue</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-11" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-info">
            <div class="modal-header border-0">
                <h5 class="modal-title text-white">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body text-white p-5">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer border-0">
                <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-info">Continue</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-12" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-warning">
            <div class="modal-header border-0">
                <h5 class="modal-title text-white">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body text-white p-5">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer border-0">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-warning">Continue</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-13" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-danger">
            <div class="modal-header border-0">
                <h5 class="modal-title text-white">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body text-white p-5">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Pellentesque lacinia non massa a euismod.
            </div>

            <div class="modal-footer border-0">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger">Continue</button>
            </div>
        </div>
    </div>
</div>

