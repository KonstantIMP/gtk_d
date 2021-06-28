module gobject.TypePluginT;

public  import gobject.c.functions;
public  import gobject.c.types;


/**
 * The GObject type system supports dynamic loading of types.
 * The #GTypePlugin interface is used to handle the lifecycle
 * of dynamically loaded types. It goes as follows:
 * 
 * 1. The type is initially introduced (usually upon loading the module
 * the first time, or by your main application that knows what modules
 * introduces what types), like this:
 * |[<!-- language="C" -->
 * new_type_id = g_type_register_dynamic (parent_type_id,
 * "TypeName",
 * new_type_plugin,
 * type_flags);
 * ]|
 * where @new_type_plugin is an implementation of the
 * #GTypePlugin interface.
 * 
 * 2. The type's implementation is referenced, e.g. through
 * g_type_class_ref() or through g_type_create_instance() (this is
 * being called by g_object_new()) or through one of the above done on
 * a type derived from @new_type_id.
 * 
 * 3. This causes the type system to load the type's implementation by
 * calling g_type_plugin_use() and g_type_plugin_complete_type_info()
 * on @new_type_plugin.
 * 
 * 4. At some point the type's implementation isn't required anymore,
 * e.g. after g_type_class_unref() or g_type_free_instance() (called
 * when the reference count of an instance drops to zero).
 * 
 * 5. This causes the type system to throw away the information retrieved
 * from g_type_plugin_complete_type_info() and then it calls
 * g_type_plugin_unuse() on @new_type_plugin.
 * 
 * 6. Things may repeat from the second step.
 * 
 * So basically, you need to implement a #GTypePlugin type that
 * carries a use_count, once use_count goes from zero to one, you need
 * to load the implementation to successfully handle the upcoming
 * g_type_plugin_complete_type_info() call. Later, maybe after
 * succeeding use/unuse calls, once use_count drops to zero, you can
 * unload the implementation again. The type system makes sure to call
 * g_type_plugin_use() and g_type_plugin_complete_type_info() again
 * when the type is needed again.
 * 
 * #GTypeModule is an implementation of #GTypePlugin that already
 * implements most of this except for the actual module loading and
 * unloading. It even handles multiple registered types per module.
 */
public template TypePluginT(TStruct)
{
	/** Get the main Gtk struct */
	public GTypePlugin* getTypePluginStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GTypePlugin*)getStruct();
	}


	/**
	 * Calls the @complete_interface_info function from the
	 * #GTypePluginClass of @plugin. There should be no need to use this
	 * function outside of the GObject type system itself.
	 *
	 * Params:
	 *     instanceType = the #GType of an instantiatable type to which the interface
	 *         is added
	 *     interfaceType = the #GType of the interface whose info is completed
	 *     info = the #GInterfaceInfo to fill in
	 */
	public void completeInterfaceInfo(GType instanceType, GType interfaceType, GInterfaceInfo* info)
	{
		g_type_plugin_complete_interface_info(getTypePluginStruct(), instanceType, interfaceType, info);
	}

	/**
	 * Calls the @complete_type_info function from the #GTypePluginClass of @plugin.
	 * There should be no need to use this function outside of the GObject
	 * type system itself.
	 *
	 * Params:
	 *     gType = the #GType whose info is completed
	 *     info = the #GTypeInfo struct to fill in
	 *     valueTable = the #GTypeValueTable to fill in
	 */
	public void completeTypeInfo(GType gType, GTypeInfo* info, GTypeValueTable* valueTable)
	{
		g_type_plugin_complete_type_info(getTypePluginStruct(), gType, info, valueTable);
	}

	/**
	 * Calls the @unuse_plugin function from the #GTypePluginClass of
	 * @plugin.  There should be no need to use this function outside of
	 * the GObject type system itself.
	 */
	public void unuse()
	{
		g_type_plugin_unuse(getTypePluginStruct());
	}

	/**
	 * Calls the @use_plugin function from the #GTypePluginClass of
	 * @plugin.  There should be no need to use this function outside of
	 * the GObject type system itself.
	 */
	public void use()
	{
		g_type_plugin_use(getTypePluginStruct());
	}
}