<template>
    <div>
        <h3 class="inline-block font-bold mr-1">{{ gardenName }}</h3>
        <button v-on:click="toggleShowForm">Anbau planen</button>
        <inertia-link class="inline-flex b items-center ml-2 px-4 py-2 text-gray-700 border rounded-md font-semibold text-xs uppercase tracking-widest shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:text-gray-800 active:bg-gray-50 transition ease-in-out duration-150"
                      method="delete" as="button" :href.prevent="route('gardens.destroy', gardenId)" preserve-scroll preserve-state>
            Garten Löschen
        </inertia-link>
        <form @submit.prevent="updateGarden()">
            <div v-show="showForm">
                <div class="col-span-7 sm:col-span-4">
                    <jet-input id="name" type="text" class="mt-1 block w-full" v-model="form.name" ref="name" required />
                    <jet-input-error :message="form.errors.name" class="mt-2" />
                </div>
                <div class="col-span-7 sm:col-span-4 flex">
                    <h3 class="inline-block mr-1 self-center">Personen zu versorgen:</h3>
                    <jet-input id="servings" type="text" class="mt-1 inline-block flex-grow" v-model="form.servings" ref="servings" required />
                    <jet-input-error :message="form.errors.servings" class="mt-2" />
                </div>
                <div class="col-span-7 sm:col-span-4 flex">
                    <h3 class="inline-block mr-1 self-center">Gewünschte Kulturen:</h3>
                    <div class="flex flex-wrap">
                        <div class="flex items-center" v-for="variety in varieties">
                            <input type="checkbox" :id="variety.variety_name" :value="variety.id" v-model="form.preferredVarieties" />
                            <label class="ml-1 mr-2 text-blue-500" :for="variety.variety_name">
                                {{ gardenVarieties.findIndex(v => v.id === variety.id) > -1 ? '(selektiert)' : '' }}
                                <span class="text-gray-700">{{ variety.variety_name }}</span>
                            </label>
                        </div>
                    </div>
                    <jet-input-error :message="form.errors.servings" class="mt-2" />
                </div>

                <jet-action-message :on="form.recentlySuccessful" class="mr-1">
                    Gespeichert.
                </jet-action-message>
                <jet-button :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Speichern
                </jet-button>
                <calculate-veg-production :gardenId="gardenId" v-show="gardenVarieties.length > 0 && gardenServings > 0" @calculated="toggleShowFormTimeout"/>
            </div>
        </form>
        <div class="m-4 p-2 border relative">
            <add-bed-form :gardenId="gardenId" />
            <bed-overview :gardenId="gardenId" />
        </div>
    </div>
</template>

<script>
    import JetActionMessage from '@/Jetstream/ActionMessage'
    import JetButton from '@/Jetstream/Button'
    import JetInput from '@/Jetstream/Input'
    import JetInputError from '@/Jetstream/InputError'
    import AddBedForm from "@/CustomComponents/Bed/AddBedForm"
    import BedOverview from "@/CustomComponents/Bed/BedOverview"
    import CalculateVegProduction from "@/CustomComponents/Garden/CalculateVegProduction"

    export default {
        props: ['gardenId', 'gardenName', 'gardenServings', 'gardenVarieties'],

        components: {
            BedOverview,
            AddBedForm,
            JetActionMessage,
            JetButton,
            JetInput,
            JetInputError,
            CalculateVegProduction,
        },

        data() {
            return {
                showForm: false,
                varieties: this.$page.props.varieties,
                form: this.$inertia.form({
                    preferredVarieties: [],
                    servings: this.gardenServings,
                    name: this.gardenName,
                }),
            }
        },

        methods: {
            toggleShowForm() {
                this.showForm = !this.showForm
            },

            toggleShowFormTimeout() {
                setTimeout(this.toggleShowForm, 2750)
            },

            updateGarden() {
                this.form.put(route('gardens.update', this.gardenId), {
                    preserveScroll: true,
                })
            },
        },

    }
</script>
