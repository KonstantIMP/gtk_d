module gstreamer.StaticPadTemplate;

private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gstreamer.Caps;
private import gstreamer.PadTemplate;
private import gstreamer.StaticCaps;
private import gstreamer.c.functions;
public  import gstreamer.c.types;
private import linker.loader;


/**
 * Structure describing the #GstStaticPadTemplate.
 */
public final class StaticPadTemplate
{
	/** the main Gtk struct */
	protected GstStaticPadTemplate* gstStaticPadTemplate;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstStaticPadTemplate* getStaticPadTemplateStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstStaticPadTemplate;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstStaticPadTemplate;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstStaticPadTemplate* gstStaticPadTemplate, bool ownedRef = false)
	{
		this.gstStaticPadTemplate = gstStaticPadTemplate;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTREAMER[0]) && ownedRef )
			sliceFree(gstStaticPadTemplate);
	}


	/**
	 * the name of the template
	 */
	public @property string nameTemplate()
	{
		return Str.toString(gstStaticPadTemplate.nameTemplate);
	}

	/** Ditto */
	public @property void nameTemplate(string value)
	{
		gstStaticPadTemplate.nameTemplate = Str.toStringz(value);
	}

	/**
	 * the direction of the template
	 */
	public @property GstPadDirection direction()
	{
		return gstStaticPadTemplate.direction;
	}

	/** Ditto */
	public @property void direction(GstPadDirection value)
	{
		gstStaticPadTemplate.direction = value;
	}

	/**
	 * the presence of the template
	 */
	public @property GstPadPresence presence()
	{
		return gstStaticPadTemplate.presence;
	}

	/** Ditto */
	public @property void presence(GstPadPresence value)
	{
		gstStaticPadTemplate.presence = value;
	}

	/**
	 * the caps of the template.
	 */
	public @property GstStaticCaps staticCaps()
	{
		return gstStaticPadTemplate.staticCaps;
	}

	/** Ditto */
	public @property void staticCaps(GstStaticCaps value)
	{
		gstStaticPadTemplate.staticCaps = value;
	}

	/**
	 * Converts a #GstStaticPadTemplate into a #GstPadTemplate.
	 *
	 * Returns: a new #GstPadTemplate.
	 */
	public PadTemplate get()
	{
		auto __p = gst_static_pad_template_get(gstStaticPadTemplate);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PadTemplate)(cast(GstPadTemplate*) __p);
	}

	/**
	 * Gets the capabilities of the static pad template.
	 *
	 * Returns: the #GstCaps of the static pad template.
	 *     Unref after usage. Since the core holds an additional
	 *     ref to the returned caps, use gst_caps_make_writable()
	 *     on the returned caps to modify it.
	 */
	public Caps getCaps()
	{
		auto __p = gst_static_pad_template_get_caps(gstStaticPadTemplate);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Caps)(cast(GstCaps*) __p, true);
	}
}
