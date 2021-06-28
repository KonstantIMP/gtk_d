module gdkpixbuf.PixbufNonAnim;

private import gdkpixbuf.Pixbuf;
private import gdkpixbuf.PixbufAnimation;
private import gdkpixbuf.c.functions;
public  import gdkpixbuf.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class PixbufNonAnim : PixbufAnimation
{
	/** the main Gtk struct */
	protected GdkPixbufNonAnim* gdkPixbufNonAnim;

	/** Get the main Gtk struct */
	public GdkPixbufNonAnim* getPixbufNonAnimStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkPixbufNonAnim;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkPixbufNonAnim;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkPixbufNonAnim* gdkPixbufNonAnim, bool ownedRef = false)
	{
		this.gdkPixbufNonAnim = gdkPixbufNonAnim;
		super(cast(GdkPixbufAnimation*)gdkPixbufNonAnim, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_pixbuf_non_anim_get_type();
	}

	/** */
	public this(Pixbuf pixbuf)
	{
		auto __p = gdk_pixbuf_non_anim_new((pixbuf is null) ? null : pixbuf.getPixbufStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GdkPixbufNonAnim*) __p, true);
	}
}
