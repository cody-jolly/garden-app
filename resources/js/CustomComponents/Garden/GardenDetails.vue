<template>
    <div>
        <form @submit.prevent="updateGarden()">
            <h3 class="inline-block font-bold mr-1">{{ gardenName }}</h3>
            <button v-on:click="toggleShowForm">Name Bearbeiten</button>
            <inertia-link class="inline-flex b items-center ml-2 px-4 py-2 text-gray-700 border rounded-md font-semibold text-xs uppercase tracking-widest shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:text-gray-800 active:bg-gray-50 transition ease-in-out duration-150"
                          method="delete" as="button" :href.prevent="route('gardens.destroy', gardenId)" preserve-scroll preserve-state>
                Garten Löschen
            </inertia-link>
            <div v-show="showForm">
                <div class="col-span-7 sm:col-span-4">
                    <jet-input id="name" type="text" class="mt-1 block w-full" v-model="form.name" ref="name" autocomplete="Garten Name" required />
                    <jet-input-error :message="form.errors.name" class="mt-2" />
                </div>
                <jet-action-message :on="form.recentlySuccessful" class="mr-1">
                    Gespeichert.
                </jet-action-message>
                <jet-button :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Speichern
                </jet-button>
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
    import JetLabel from '@/Jetstream/Label'
    import AddBedForm from "@/CustomComponents/Bed/AddBedForm";
    import BedOverview from "@/CustomComponents/Bed/BedOverview";

    export default {
        props: ['gardenId', 'gardenName', 'hideForm'],

        components: {
            BedOverview,
            AddBedForm,
            JetActionMessage,
            JetButton,
            JetInput,
            JetInputError,
            JetLabel,
        },

        data() {
            return {
                showForm: false,
                form: this.$inertia.form({
                    name: '',
                }),
            }
        },

        methods: {
            toggleShowForm() {
                console.log(this.showForm)
                this.showForm = !this.showForm
            },

            updateGarden() {
                this.form.put(route('gardens.update', this.gardenId), {
                    preserveScroll: true,
                    onSuccess: () => {
                        this.form.reset()
                        this.toggleShowForm()
                    }
                })
            }
        },

    }
</script>
