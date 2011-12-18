package de.susannej.urlaub



import org.junit.*
import grails.test.mixin.*

@TestFor(ReasonController)
@Mock(Reason)
class ReasonControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reason/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reasonInstanceList.size() == 0
        assert model.reasonInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.reasonInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reasonInstance != null
        assert view == '/reason/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reason/show/1'
        assert controller.flash.message != null
        assert Reason.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reason/list'


        populateValidParams(params)
        def reason = new Reason(params)

        assert reason.save() != null

        params.id = reason.id

        def model = controller.show()

        assert model.reasonInstance == reason
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reason/list'


        populateValidParams(params)
        def reason = new Reason(params)

        assert reason.save() != null

        params.id = reason.id

        def model = controller.edit()

        assert model.reasonInstance == reason
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reason/list'

        response.reset()


        populateValidParams(params)
        def reason = new Reason(params)

        assert reason.save() != null

        // test invalid parameters in update
        params.id = reason.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reason/edit"
        assert model.reasonInstance != null

        reason.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reason/show/$reason.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reason.clearErrors()

        populateValidParams(params)
        params.id = reason.id
        params.version = -1
        controller.update()

        assert view == "/reason/edit"
        assert model.reasonInstance != null
        assert model.reasonInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reason/list'

        response.reset()

        populateValidParams(params)
        def reason = new Reason(params)

        assert reason.save() != null
        assert Reason.count() == 1

        params.id = reason.id

        controller.delete()

        assert Reason.count() == 0
        assert Reason.get(reason.id) == null
        assert response.redirectedUrl == '/reason/list'
    }
}
