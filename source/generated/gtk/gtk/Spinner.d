module gtk.Spinner;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A `GtkSpinner` widget displays an icon-size spinning animation.
 * 
 * It is often used as an alternative to a [class@Gtk.ProgressBar]
 * for displaying indefinite activity, instead of actual progress.
 * 
 * ![An example GtkSpinner](spinner.png)
 * 
 * To start the animation, use [method@Gtk.Spinner.start], to stop it
 * use [method@Gtk.Spinner.stop].
 * 
 * # CSS nodes
 * 
 * `GtkSpinner` has a single CSS node with the name spinner.
 * When the animation is active, the :checked pseudoclass is
 * added to this node.
 */
public class Spinner : Widget
{
	/** the main Gtk struct */
	protected GtkSpinner* gtkSpinner;

	/** Get the main Gtk struct */
	public GtkSpinner* getSpinnerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSpinner;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSpinner;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSpinner* gtkSpinner, bool ownedRef = false)
	{
		this.gtkSpinner = gtkSpinner;
		super(cast(GtkWidget*)gtkSpinner, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_spinner_get_type();
	}

	/**
	 * Returns a new spinner widget. Not yet started.
	 *
	 * Returns: a new `GtkSpinner`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_spinner_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSpinner*) __p);
	}

	/**
	 * Returns whether the spinner is spinning.
	 *
	 * Returns: %TRUE if the spinner is active
	 */
	public bool getSpinning()
	{
		return gtk_spinner_get_spinning(gtkSpinner) != 0;
	}

	/**
	 * Sets the activity of the spinner.
	 *
	 * Params:
	 *     spinning = whether the spinner should be spinning
	 */
	public void setSpinning(bool spinning)
	{
		gtk_spinner_set_spinning(gtkSpinner, spinning);
	}

	/**
	 * Starts the animation of the spinner.
	 */
	public void start()
	{
		gtk_spinner_start(gtkSpinner);
	}

	/**
	 * Stops the animation of the spinner.
	 */
	public void stop()
	{
		gtk_spinner_stop(gtkSpinner);
	}
}
