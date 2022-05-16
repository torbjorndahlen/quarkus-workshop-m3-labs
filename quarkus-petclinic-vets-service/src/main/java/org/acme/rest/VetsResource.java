package org.acme.rest;

import javax.inject.Inject;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import java.util.List;
import javax.ws.rs.GET;
import org.acme.model.Vet;

import org.acme.service.VetsService;
import org.jboss.logging.Logger;

// import java.util.List;
// import javax.ws.rs.GET;
// import org.acme.model.Vet;

@Path("/vets")
@Produces(MediaType.APPLICATION_JSON)
public class VetsResource {

    static Logger LOG = Logger.getLogger(VetsResource.class);

    @Inject
    VetsService service;

    @GET
    public List<Vet> get() {
        LOG.debug("Inside get() method");
        return service.getAll();
    }

}