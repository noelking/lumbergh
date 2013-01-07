package org.jcloudchaos.web.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(VirtualMachineController)
@Mock(VirtualMachine)
class VirtualMachineControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/virtualMachine/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.virtualMachineInstanceList.size() == 0
        assert model.virtualMachineInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.virtualMachineInstance != null
    }

    void testSave() {
        controller.save()

        assert model.virtualMachineInstance != null
        assert view == '/virtualMachine/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/virtualMachine/show/1'
        assert controller.flash.message != null
        assert VirtualMachine.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/virtualMachine/list'

        populateValidParams(params)
        def virtualMachine = new VirtualMachine(params)

        assert virtualMachine.save() != null

        params.id = virtualMachine.id

        def model = controller.show()

        assert model.virtualMachineInstance == virtualMachine
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/virtualMachine/list'

        populateValidParams(params)
        def virtualMachine = new VirtualMachine(params)

        assert virtualMachine.save() != null

        params.id = virtualMachine.id

        def model = controller.edit()

        assert model.virtualMachineInstance == virtualMachine
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/virtualMachine/list'

        response.reset()

        populateValidParams(params)
        def virtualMachine = new VirtualMachine(params)

        assert virtualMachine.save() != null

        // test invalid parameters in update
        params.id = virtualMachine.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/virtualMachine/edit"
        assert model.virtualMachineInstance != null

        virtualMachine.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/virtualMachine/show/$virtualMachine.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        virtualMachine.clearErrors()

        populateValidParams(params)
        params.id = virtualMachine.id
        params.version = -1
        controller.update()

        assert view == "/virtualMachine/edit"
        assert model.virtualMachineInstance != null
        assert model.virtualMachineInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/virtualMachine/list'

        response.reset()

        populateValidParams(params)
        def virtualMachine = new VirtualMachine(params)

        assert virtualMachine.save() != null
        assert VirtualMachine.count() == 1

        params.id = virtualMachine.id

        controller.delete()

        assert VirtualMachine.count() == 0
        assert VirtualMachine.get(virtualMachine.id) == null
        assert response.redirectedUrl == '/virtualMachine/list'
    }
}
