module gstreamer.ElementFactory;

private import glib.ListG;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gstreamer.Caps;
private import gstreamer.Element;
private import gstreamer.PluginFeature;
private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * #GstElementFactory is used to create instances of elements. A
 * GstElementFactory can be added to a #GstPlugin as it is also a
 * #GstPluginFeature.
 * 
 * Use the gst_element_factory_find() and gst_element_factory_create()
 * functions to create element instances or use gst_element_factory_make() as a
 * convenient shortcut.
 * 
 * The following code example shows you how to create a GstFileSrc element.
 * 
 * ## Using an element factory
 * |[<!-- language="C" -->
 * #include &lt;gst/gst.h&gt;
 * 
 * GstElement *src;
 * GstElementFactory *srcfactory;
 * 
 * gst_init (&amp;argc, &amp;argv);
 * 
 * srcfactory = gst_element_factory_find ("filesrc");
 * g_return_if_fail (srcfactory != NULL);
 * src = gst_element_factory_create (srcfactory, "src");
 * g_return_if_fail (src != NULL);
 * ...
 * ]|
 */
public class ElementFactory : PluginFeature
{
	/** the main Gtk struct */
	protected GstElementFactory* gstElementFactory;

	/** Get the main Gtk struct */
	public GstElementFactory* getElementFactoryStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstElementFactory;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gstElementFactory;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstElementFactory* gstElementFactory, bool ownedRef = false)
	{
		this.gstElementFactory = gstElementFactory;
		super(cast(GstPluginFeature*)gstElementFactory, ownedRef);
	}

	/**
	 * Create a new element of the type defined by the given element factory.
	 * The element will receive a guaranteed unique name,
	 * consisting of the element factory name and a number.
	 * Params:
	 *  factoryname = a named factory to instantiate
	 * Returns:
	 *  new GstElement or NULL if unable to create element
	 */
	public static Element make( string factoryname ) {
		// GstElement* gst_element_factory_make (const gchar *factoryname,  const gchar *name);
		auto p = gst_element_factory_make(Str.toStringz(factoryname), null );

		if(p is null) {
			return null;
	}

	return ObjectG.getDObject!(Element)(cast(GstElement*) p);
}

/**
 */

/** */
public static GType getType()
{
	return gst_element_factory_get_type();
}

/**
 * Search for an element factory of the given name. Refs the returned
 * element factory; caller is responsible for unreffing.
 *
 * Params:
 *     name = name of factory to find
 *
 * Returns: #GstElementFactory if found,
 *     %NULL otherwise
 */
public static ElementFactory find(string name)
{
	auto __p = gst_element_factory_find(Str.toStringz(name));

	if(__p is null)
	{
		return null;
	}

	return ObjectG.getDObject!(ElementFactory)(cast(GstElementFactory*) __p, true);
}

/**
 * Filter out all the elementfactories in @list that can handle @caps in
 * the given direction.
 *
 * If @subsetonly is %TRUE, then only the elements whose pads templates
 * are a complete superset of @caps will be returned. Else any element
 * whose pad templates caps can intersect with @caps will be returned.
 *
 * Params:
 *     list = a #GList of
 *         #GstElementFactory to filter
 *     caps = a #GstCaps
 *     direction = a #GstPadDirection to filter on
 *     subsetonly = whether to filter on caps subsets or not.
 *
 * Returns: a #GList of
 *     #GstElementFactory elements that match the given requisites.
 *     Use #gst_plugin_feature_list_free after usage.
 */
public static ListG listFilter(ListG list, Caps caps, GstPadDirection direction, bool subsetonly)
{
	auto __p = gst_element_factory_list_filter((list is null) ? null : list.getListGStruct(), (caps is null) ? null : caps.getCapsStruct(), direction, subsetonly);

	if(__p is null)
	{
		return null;
	}

	return new ListG(cast(GList*) __p, true);
}

/**
 * Get a list of factories that match the given @type. Only elements
 * with a rank greater or equal to @minrank will be returned.
 * The list of factories is returned by decreasing rank.
 *
 * Params:
 *     type = a #GstElementFactoryListType
 *     minrank = Minimum rank
 *
 * Returns: a #GList of
 *     #GstElementFactory elements. Use gst_plugin_feature_list_free() after
 *     usage.
 */
public static ListG listGetElements(GstElementFactoryListType type, GstRank minrank)
{
	auto __p = gst_element_factory_list_get_elements(type, minrank);

	if(__p is null)
	{
		return null;
	}

	return new ListG(cast(GList*) __p, true);
}

/**
 * Create a new element of the type defined by the given element factory.
 * If name is %NULL, then the element will receive a guaranteed unique name,
 * consisting of the element factory name and a number.
 * If name is given, it will be given the name supplied.
 *
 * Params:
 *     factoryname = a named factory to instantiate
 *     name = name of new element, or %NULL to automatically create
 *         a unique name
 *
 * Returns: new #GstElement or %NULL
 *     if unable to create element
 */
public static Element make(string factoryname, string name)
{
	auto __p = gst_element_factory_make(Str.toStringz(factoryname), Str.toStringz(name));

	if(__p is null)
	{
		return null;
	}

	return ObjectG.getDObject!(Element)(cast(GstElement*) __p);
}

/**
 * Checks if the factory can sink all possible capabilities.
 *
 * Params:
 *     caps = the caps to check
 *
 * Returns: %TRUE if the caps are fully compatible.
 */
public bool canSinkAllCaps(Caps caps)
{
	return gst_element_factory_can_sink_all_caps(gstElementFactory, (caps is null) ? null : caps.getCapsStruct()) != 0;
}

/**
 * Checks if the factory can sink any possible capability.
 *
 * Params:
 *     caps = the caps to check
 *
 * Returns: %TRUE if the caps have a common subset.
 */
public bool canSinkAnyCaps(Caps caps)
{
	return gst_element_factory_can_sink_any_caps(gstElementFactory, (caps is null) ? null : caps.getCapsStruct()) != 0;
}

/**
 * Checks if the factory can src all possible capabilities.
 *
 * Params:
 *     caps = the caps to check
 *
 * Returns: %TRUE if the caps are fully compatible.
 */
public bool canSrcAllCaps(Caps caps)
{
	return gst_element_factory_can_src_all_caps(gstElementFactory, (caps is null) ? null : caps.getCapsStruct()) != 0;
}

/**
 * Checks if the factory can src any possible capability.
 *
 * Params:
 *     caps = the caps to check
 *
 * Returns: %TRUE if the caps have a common subset.
 */
public bool canSrcAnyCaps(Caps caps)
{
	return gst_element_factory_can_src_any_caps(gstElementFactory, (caps is null) ? null : caps.getCapsStruct()) != 0;
}

/**
 * Create a new element of the type defined by the given elementfactory.
 * It will be given the name supplied, since all elements require a name as
 * their first argument.
 *
 * Params:
 *     name = name of new element, or %NULL to automatically create
 *         a unique name
 *
 * Returns: new #GstElement or %NULL
 *     if the element couldn't be created
 */
public Element create(string name)
{
	auto __p = gst_element_factory_create(gstElementFactory, Str.toStringz(name));

	if(__p is null)
	{
		return null;
	}

	return ObjectG.getDObject!(Element)(cast(GstElement*) __p);
}

/**
 * Get the #GType for elements managed by this factory. The type can
 * only be retrieved if the element factory is loaded, which can be
 * assured with gst_plugin_feature_load().
 *
 * Returns: the #GType for elements managed by this factory or 0 if
 *     the factory is not loaded.
 */
public GType getElementType()
{
	return gst_element_factory_get_element_type(gstElementFactory);
}

/**
 * Get the metadata on @factory with @key.
 *
 * Params:
 *     key = a key
 *
 * Returns: the metadata with @key on @factory or %NULL
 *     when there was no metadata with the given @key.
 */
public string getMetadata(string key)
{
	return Str.toString(gst_element_factory_get_metadata(gstElementFactory, Str.toStringz(key)));
}

/**
 * Get the available keys for the metadata on @factory.
 *
 * Returns: a %NULL-terminated array of key strings, or %NULL when there is no
 *     metadata. Free with g_strfreev() when no longer needed.
 */
public string[] getMetadataKeys()
{
	auto retStr = gst_element_factory_get_metadata_keys(gstElementFactory);

	scope(exit) Str.freeStringArray(retStr);
	return Str.toStringArray(retStr);
}

/**
 * Gets the number of pad_templates in this factory.
 *
 * Returns: the number of pad_templates
 */
public uint getNumPadTemplates()
{
	return gst_element_factory_get_num_pad_templates(gstElementFactory);
}

/**
 * Gets the #GList of #GstStaticPadTemplate for this factory.
 *
 * Returns: the
 *     static pad templates
 */
public ListG getStaticPadTemplates()
{
	auto __p = gst_element_factory_get_static_pad_templates(gstElementFactory);

	if(__p is null)
	{
		return null;
	}

	return new ListG(cast(GList*) __p);
}

/**
 * Gets a %NULL-terminated array of protocols this element supports or %NULL if
 * no protocols are supported. You may not change the contents of the returned
 * array, as it is still owned by the element factory. Use g_strdupv() to
 * make a copy of the protocol string array if you need to.
 *
 * Returns: the supported protocols
 *     or %NULL
 */
public string[] getUriProtocols()
{
	return Str.toStringArray(gst_element_factory_get_uri_protocols(gstElementFactory));
}

/**
 * Gets the type of URIs the element supports or #GST_URI_UNKNOWN if none.
 *
 * Returns: type of URIs this element supports
 */
public GstURIType getUriType()
{
	return gst_element_factory_get_uri_type(gstElementFactory);
}

/**
 * Check if @factory implements the interface with name @interfacename.
 *
 * Params:
 *     interfacename = an interface name
 *
 * Returns: %TRUE when @factory implement the interface.
 */
public bool hasInterface(string interfacename)
{
	return gst_element_factory_has_interface(gstElementFactory, Str.toStringz(interfacename)) != 0;
}

/**
 * Check if @factory is of the given types.
 *
 * Params:
 *     type = a #GstElementFactoryListType
 *
 * Returns: %TRUE if @factory is of @type.
 */
public bool listIsType(GstElementFactoryListType type)
{
	return gst_element_factory_list_is_type(gstElementFactory, type) != 0;
}
}
