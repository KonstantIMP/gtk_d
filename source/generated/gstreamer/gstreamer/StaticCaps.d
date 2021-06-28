module gstreamer.StaticCaps;

private import gobject.ObjectG;
private import gstreamer.Caps;
private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * Datastructure to initialize #GstCaps from a string description usually
 * used in conjunction with GST_STATIC_CAPS() and gst_static_caps_get() to
 * instantiate a #GstCaps.
 */
public class StaticCaps
{
	/** the main Gtk struct */
	protected GstStaticCaps* gstStaticCaps;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstStaticCaps* getStaticCapsStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstStaticCaps;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstStaticCaps;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstStaticCaps* gstStaticCaps, bool ownedRef = false)
	{
		this.gstStaticCaps = gstStaticCaps;
		this.ownedRef = ownedRef;
	}


	/**
	 * Clean up the cached caps contained in @static_caps.
	 */
	public void cleanup()
	{
		gst_static_caps_cleanup(gstStaticCaps);
	}

	/**
	 * Converts a #GstStaticCaps to a #GstCaps.
	 *
	 * Returns: a pointer to the #GstCaps. Unref
	 *     after usage. Since the core holds an additional ref to the
	 *     returned caps, use gst_caps_make_writable() on the returned caps
	 *     to modify it.
	 */
	public Caps get()
	{
		auto __p = gst_static_caps_get(gstStaticCaps);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Caps)(cast(GstCaps*) __p, true);
	}
}
