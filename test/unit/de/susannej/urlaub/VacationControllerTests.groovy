package de.susannej.urlaub



import org.junit.*
import grails.test.mixin.*

@TestFor(VacationController)
@Mock(Vacation)
class VacationControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/vacation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.vacationInstanceList.size() == 0
        assert model.vacationInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.vacationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.vacationInstance != null
        assert view == '/vacation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/vacation/show/1'
        assert controller.flash.message != null
        assert Vacation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/vacation/list'


        populateValidParams(params)
        def vacation = new Vacation(params)

        assert vacation.save() != null

        params.id = vacation.id

        def model = controller.show()

        assert model.vacationInstance == vacation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/vacation/list'


        populateValidParams(params)
        def vacation = new Vacation(params)

        assert vacation.save() != null

        params.id = vacation.id

        def model = controller.edit()

        assert model.vacationInstance == vacation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/vacation/list'

        response.reset()


        populateValidParams(params)
        def vacation = new Vacation(params)

        assert vacation.save() != null

        // test invalid parameters in update
        params.id = vacation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/vacation/edit"
        assert model.vacationInstance != null

        vacation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/vacation/show/$vacation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        vacation.clearErrors()

        populateValidParams(params)
        params.id = vacation.id
        params.version = -1
        controller.update()

        assert view == "/vacation/edit"
        assert model.vacationInstance != null
        assert model.vacationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/vacation/list'

        response.reset()

        populateValidParams(params)
        def vacation = new Vacation(params)

        assert vacation.save() != null
        assert Vacation.count() == 1

        params.id = vacation.id

        controller.delete()

        assert Vacation.count() == 0
        assert Vacation.get(vacation.id) == null
        assert response.redirectedUrl == '/vacation/list'
    }
}
